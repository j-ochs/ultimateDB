<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <?php $PnameVal = $_POST[pname]; ?>
    <script type="text/javascript">
        function alertSuccess() {
            alert("Successfully added new player: <?php echo $PnameVal;?>");
        }
        function alertFail() {
            var pname = "<?php echo $PnameVal; ?>";
            if (pname) {
                alert("ERROR: Player " + pname + " already exists!");
            }
            else {}
        } 
    </script>
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


<?php
//connect to database
$dbconn = pg_connect("host=localhost port=5432 dbname=jochs user=jochs password=0520174");
//database connection error handling
if(!$dbconn){
 echo "A database  connection error occurred.\n";
 die(pg_last_error($dbconn));
}

?>

<div style="margin: auto;
    width: 90%;
    border: 3px solid green;
    padding: 10px;">
  <h3>Add New Player</h3>
  <ul>
    <form action="" name="insert" method="POST" onSubmit="window.location.reload()">
      Name (must be unique):<br><input type="text" name="pname" required><br>
      Age:<br><input type="number" name="age" min="1" required/><br>
      Gender:<br><input type="radio" name="gender" value="M" required checked> Male<br>
                 <input type="radio" name="gender" value="F" required> Female<br>
      Position:<br><input type="radio" name="posn" value="Handler"required checked> Handler<br>
                   <input type="radio" name="posn" value="Cutter"required> Cutter<br>
      Jersey Number (0-99):<br><input type="number" name="jersey" min="0" max="99"required/><br>
      Hometown:<br><input type="text" name="hometown" required/><br>
      Team: <br><input type="text" name="tname" required/><br>
      League: <br><input type="text" name="league" required/><br>
      <input type="hidden" name="stat" value="0"/>
      <br><input type="submit" /><br>
    </form>
  </ul>
</div>

<?php
    //initial insertion of values from html form
    $insert = "INSERT INTO Player VALUES ('$_POST[pname]', '$_POST[age]', '$_POST[gender]','$_POST[posn]', '$_POST[jersey]', '$_POST[hometown]')";
    $insertRes = pg_query($insert);
    $PnameVal = $_POST[pname];

    //to deal with primary keys, if the first insertion was successful, then we continue
    // and insert into the other tables which share a primary key.
    if ($insertRes) {
        $insertPlaysFor = "INSERT INTO PlaysFor VALUES ('$_POST[pname]', '$_POST[tname]', '$_POST[league]')";
        $playsForRes = pg_query($insertPlaysFor);
    }
    if ($insertRes) {
        $insertRecords = "INSERT INTO Records VALUES ('$_POST[pname]', '$_POST[stat]', '$_POST[stat]', '$_POST[stat]', '$_POST[stat]', '$_POST[stat]', '$_POST[stat]', '$_POST[stat]', '$_POST[stat]')";
        $recordsRes = pg_query($insertRecords);
    }

    //if all 3 insertions were successful, call the alertSuccess js function
    if ($insertRes && $recordsRes && $playsForRes) {
        echo '<script type="text/javascript">',
         'alertSuccess();',
         '</script>';
    }

    //check for errors. If the error was to do with unique key constraints, call the alertFail js function
    $dbe = pg_last_error($dbconn);
    $pkErr = "ERROR: duplicate key value violates unique constraint \"player_pkey\" DETAIL: Key (pname)=({$PnameVal}) already exists.";

    if (strcmp($dbe, $pkErr)) {
        echo '<script type="text/javascript">',
         'alertFail();',
        '</script>';
    }
?>

<div style="margin: auto; width:90%; padding:10px">
  <a style="" href="../~jochs128/players.php" class="btn btn-default">Back</a>
  <a style="" href="../~jochs128/index.php" class="btn btn-default">Home</a>
</div>
</body>
</html>

 
