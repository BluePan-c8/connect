<?php 
header("Access-Control-Allow-Origin: *");
function dbconnection(){
    $con=mysqli_connect("localhost","root","","connection_test");
    return $con;
}

?>
