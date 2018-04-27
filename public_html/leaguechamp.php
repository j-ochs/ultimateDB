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
  <h2 style="float:left; margin-top:0px">Current League Champions</h2>
</div>

<table>
  <thead>
    <tr>
      <td>League</td>
      <td>Team</td>
      <td>Wins</td>
      <td>Losses</td>
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

//Query for winningest team with fewest losses for each league
$result = pg_query($dbconn, "select distinct on (league) league, tname, wins, losses from team order by league, wins DESC, losses ASC limit 10;");
if (!$result) {
  echo "A query error occurred.\n";
  exit;
}


//display results in html table 
while($row=pg_fetch_array($result)) {
  ?>
    <tr>
      <td><?php echo $row[0]?></td>
      <td><?php echo $row[1]?></td>
      <td><?php echo $row[2]?></td>
      <td><?php echo $row[3]?></td>
    </tr>

  <!--echo "PName: ", $row[0];-->
  <?php
  } ?>
  </tbody>
  </table>
</div>
<br>

<br><a href="../~jochs128/index.php" class="btn btn-default">Home</a>
</body>
</html>


