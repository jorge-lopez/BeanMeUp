<?php

$username = $_POST['User'];
$password = $_POST['Pass'];
$connection = mysql_connect("mysql.fhero.net", "u304295155_hdcde", "hardcode123", "u304295155_bnmup") or die('Could not connect to mysql server.');
mysql_select_db("u304295155_bnmup") or die("cannot connect to the database" . mysql_error());
$LoginCredentials ="call sp_Login('$username','$password');";
$LoginQuery = mysql_query($LoginCredentials);
while ($row = mysql_fetch_assoc($LoginQuery)) {
	$dbEmail = $row['Email'];
	$dbPassword = $row['Password'];
	$dbFirstName = $row['FirstName'];
}
if( empty($_POST['User']) && empty($_POST['Pass']) ) {
	header('Location: index.html' );
}
else if ($username == $dbEmail && $password == $dbPassword) {

	//$encryptedPassword = md5($dbPassword);
	session_start();
	$_SESSION["Login"] = "YES";
	$_SESSION["Name"] = $dbFirstName;
	header('Location: MainPage/main.html' );
}
else {
	header('Location: index.html' );
}

mysql_close()
?>