<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <?php $PnameVal = $_POST[pname]; ?>
    <script type="text/javascript">
        function alertSuccess() {
            var pname = "<?php echo $PnameVal; ?>";
	    if (pname) {
                alert("Successfully deleted player " + pname);
            }
        }
        function alertFail() {
            var pname = "<?php echo $PnameVal; ?>";
            if (pname) {
                alert("ERROR deleting player " + pname);
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
<div style="margin: auto;
    width: 90%;
    border: 3px solid green;
    padding: 10px;">
  <div style="width:100%">
    <h2 style="float:left; margin-top:0px">Delete Player</h2>
    <a style="float:right" href="../~jochs128/players.php" class="btn btn-default">View Players</a>
  </div><br><br><br>
    <span>Enter Name: </span>
    <!-- auto-submitting form for sorting -->
    <form action="" name="delete" onSubmit="window.location.reload()"method="POST">
      <input type="text" name="pname" required><br>
      <input type="submit"/>
    </form>

<?php
//connect to database
$dbconn = pg_connect("host=localhost port=5432 dbname=jochs user=jochs password=0520174");

//database connection error handling
if(!$dbconn){
 echo "A database  connection error occurred.\n";
 die(pg_last_error($dbconn));
}

    //initial delete from query
    $delete = "DELETE FROM Playsfor WHERE pname = '$_POST[pname]'";
    $deleteRes = pg_query($delete);
    $PnameVal = $_POST[pname];

    //to deal with primary key constraints, if the first deletion was successful we continue
    // and delete from the other two tables which share primary key constraints
    if ($deleteRes) {
        $deletePlaysFor = "DELETE FROM Records WHERE pname = '$_POST[pname]'";
        $playsForRes = pg_query($deletePlaysFor);
    }
    if ($deleteRes) {
        $deleteRecords = "DELETE FROM Player WHERE pname = '$_POST[pname]'";
        $recordsRes = pg_query($deleteRecords);
    }

    //check how many rows are affected, to see if our deletion was successful or not
    // if it was successful, call alertSuccess js function. Otherwise, call alertFail js function
    $affected1 = pg_affected_rows($deleteRes);
    if ($affected1 < 1) {
       echo '<script type="text/javascript">',
         'alertFail();',
        '</script>';
    } 
    if ($deleteRes && $recordsRes && $playsForRes && $affected1 > 0) {
        echo '<script type="text/javascript">',
         'alertSuccess();',
         '</script>';
    }

?>

<br><a href="../~jochs128/index.php" class="btn btn-default">Home</a>
</div>
</body>
</html>

