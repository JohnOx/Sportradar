<?php
// this will avoid mysql_connect() deprecation error.
error_reporting( ~E_DEPRECATED & ~E_NOTICE );

    $localhost= "localhost";
    $username = "root";
    $password = "";
    $dbname = "sportevents";

    $con = mysqli_connect($localhost, $username, $password, $dbname);

    // check connection
    if ($con->connect_error) {
        die("connection failed: " . $con->connect_error);
    }//  else {
    //     echo "Success!";
    // }

?>