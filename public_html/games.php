<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

thead {
  font-weight: bold;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

</style>
</head>

<body>
<div style="margin: auto;
    width: 90%;
    border: 3px solid green;
    padding: 10px;">
<div style="width:100%">
  <h2 style="float:left; margin-top:0px">Games and Results</h2>
</div>

<table>
  <thead>
    <tr>
      <td>Location</td>
      <td>StartTime</td>
      <td>Description</td>
      <td>FinalScore</td>
    </tr>
  </thead>
  <tbody>

<?php
//connect to database
$dbconn = pg_connect("host=localhost port=5432 dbname=jochs user=jochs password=0520174");

//database connection error handling
if(!$dbconn){
    echo "A database  connection error occurred.\n";
    die(pg_last_error($dbconn));
}


$result = pg_query($dbconn, "SELECT * FROM Game LIMIT 30");
if (!$result) {
    echo "A query error occurred.\n";
    exit;
}

//query for all tuples that contain trigger word 'delay' in their description
$delays = pg_query($dbconn, "SELECT Description from Game where Description LIKE '%delay%'");
    if (!$delays) {
        echo "A query error occurred.\n";
        exit;
    }

//count result of query to find how many unique games are delayed
$delayedGameCount = pg_num_rows($delays);
$formLabel = "Update StartTime(s)";

//display results of query in html table
while($row=pg_fetch_array($result)) {
  ?>
    <tr>
      <td><?php echo $row[0]?></td>
      <td><?php echo $row[1]?></td>
      <td><?php echo $row[2]?></td>
      <td><?php echo $row[3]?></td>
    </tr>
  <?php
  } ?>
  </tbody>
  </table><br>

    <?php
    echo $delayedGameCount . " games delayed.\n";
    //show user number of delayed games and display button to update the games' starttimes
    if ($delayedGameCount > 0) {
        echo '<form action="games.php" method="POST"><input type="submit" value="Update Game StartTime(s)" name="delay" id="delay"></input></form>';
    }

    //call pl/pgsql function and query again if button is clicked by user, then refresh page
    if(isset($_POST['delay'])) {
        $delayFunc = pg_query($dbconn, 'SELECT delayedGame()');
        $result = pg_query($dbconn, "SELECT * FROM Game LIMIT 10");
        echo "it is set!@@@@!";
        $page = $_SERVER['PHP_SELF'];
        $sec = "0";
        header("Refresh: $sec; url=$page");
    }
  ?>

<!--<br><a href="" class="btn btn-default">Game delayed - Update StartTime</a>-->
<br><a href="../~jochs128/index.php" class="btn btn-default">Home</a>
</div>
</body>
</html>
