<?php

$username = $_POST['User'];
$password = $_POST['Pass'];

if($username == "admin@gmail.com" && $password == "12345"){
	echo "Succesful Login";
}
else{
	echo "Incorrect Credentials";
	header('Location: MainPage\main.html');
}


?>