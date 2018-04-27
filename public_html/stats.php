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
  <h2>Player Statistics</h2>
  <div style="margin: auto;
    width: 50%;
    border: 3px solid green;
    padding: 10px; float:left">
    <span>Sort by</span>
    <!-- auto-submitting form for sorting -->
    <form action="" method="POST">
      <select name='name' onchange='this.form.submit()'>
        <option value="goals">Goals</option>
        <option value="assists">Assists</option>
        <option value="catches">Catches</option>
        <option value="completions">Completions</option>
        <option value="turnovers">Turnovers</option>
        <option value="blocks">Blocks</option>
        <option value="pointsplayed">PointsPlayed</option>
        <option value="unforcederrors">UnforcedErrors</option>
      </select>
    </form>
  
  </div><br>
  <table>
    <thead>
      <tr>
        <td>Name</td>
        <td>Goals</td>
        <td>Assists</td>
        <td>Catches</td>
        <td>Completions</td>
        <td>Turnovers</td>
        <td>Blocks</td>
        <td>Points Played</td>
        <td>Unforced Errors</td>
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

//extract html input form variable
$formVal = $_POST['name'];

//customize query's sort based on html form variable
if ($formVal) {
    $result = pg_query($dbconn, "select * from Records order by $formVal DESC LIMIT 50");
}
if (!$formVal) {
    $result = pg_query($dbconn, "select * from Records LIMIT 50");
}

//query error handling
if (!$result) {
  echo "A query error occurred.\n";
  exit;
}

//display results of query in table
while($row=pg_fetch_array($result)) {
  ?>
    <tr>
      <td><?php echo $row[0]?></td>
      <td><?php echo $row[1]?></td>
      <td><?php echo $row[2]?></td>
      <td><?php echo $row[3]?></td>
      <td><?php echo $row[4]?></td>
      <td><?php echo $row[5]?></td>
      <td><?php echo $row[6]?></td>
      <td><?php echo $row[7]?></td>
      <td><?php echo $row[8]?></td>
    </tr>
    <?php } ?>
  </tbody>
  </table>

<br><a href="../~jochs128/index.php" class="btn btn-default">Home</a>
</div>
</body>
</html>

