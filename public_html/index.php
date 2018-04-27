<html>

<body>
<h1>Welcome to THE ULTIMATE (frisbee) DATABASE</h1>

<?php
//connect to database
$dbconn = pg_connect("host=localhost port=5432 dbname=jochs user=jochs password=0520174");

//database connection error handling
if(!$dbconn){
 echo "A database  connection error occurred.\n";
 die(pg_last_error($dbconn));
}


$result = pg_query($dbconn, "SELECT PName, Position FROM Player LIMIT 10");

if (!$result) {
  echo "A query error occurred.\n";
  exit;
}
?>

<!--
<table>
<tr><td> <input type="hidden" name="type" value="<?= $var ?>" ></td></tr>
</table>
-->

<br>
<a href="./players.php">Players</a><br>
<a href="./stats.php">Stats</a><br>
<a href="./games.php">Games and Results</a><br>
<a href="./coaches.php">Coaches</a><br>
<a href="./teams.php">Teams</a><br><br>

<a href="./delete.php">Delete Player</a><span> - Delete an existing player from the database</span>
<br><a href="./addplayer.php">Add Player</a><span> - Insert a new player into the database</span>
<br><a href="./leaguechamp.php">League Champions</a><span> - View champion (winningest team with fewest losses) for each league</span>
<br><a href="./homegrown.php">Hometown Players</a><span> - View player(s) whose hometown is same as their team's home city</span>

</body>

</html>
