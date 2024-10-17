<?php
    header("Access-Control-Allow-Origin: *");
    header ("Accept: application/json");

    include("dbconnection.php");

    $con=dbconnection();
    $query="SELECT `User_name`,`User_role`FROM `User` WHERE User_ID = 1;";

    $exe=mysqli_query($con,$query);

    $arr=[];

    while($row=mysqli_fetch_array($exe)){
        $arr[]=$row;
    }

    print(json_encode($arr));

    
