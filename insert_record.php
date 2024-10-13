<?php
header("Access-Control-Allow-Origin: *");
include("dbconnection.php");

$con=dbconnection();

if(isset($_POST["name"])){
    $name=$_POST["name"];
} else{
    return;
}


if(isset($_POST["email"])){
    $email=$_POST["email"];
} 
else return;

if(isset($_POST["password"])){
    $password=$_POST["password"];
}
else return;

$query="INSERT INTO `User`(`User_name`, `User_password`, `User_email`) VALUES ('$name','$password','$email')";

$exe=mysqli_query($con,$query);

$arr=[];
if($exe){
    $arr['success']='true';
}
else{
    $arr['success']='false';
}
print(json_encode($arr))
?>
