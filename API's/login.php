<?php

$username = $_POST['User'];
$password = $_POST['Pass'];

$connection = mysqli_connect("31.170.166.32","beanmeup");
if($connection){
	echo "Connection Succesful\n";
}
else{
	echo "Failed to connect";
}

if($username == "admin@gmail.com" && $password == "12345"){
	echo "Succesful Login";
}
else{
	echo "Incorrect Credentials";
}


?>