<?php
include '../db_connect.php';
$username = $_POST['User'];
$password = $_POST['Pass'];
$LoginCredentials ="call sp_Login('$username','$password');";
$LoginQuery = mysql_query($LoginCredentials);
while ($row = mysql_fetch_assoc($LoginQuery)) {
	$dbEmail = $row['Email'];
	$dbPassword = $row['Password'];
	$dbFirstName = $row['FirstName'];
	$dbEmployeeID = $row['EmployeeID'];
}
if( empty($_POST['User']) && empty($_POST['Pass']) ) {
	header('Location: loginPage.html' );
}
else if ($username == $dbEmail && $password == $dbPassword) {

	//$encryptedPassword = md5($dbPassword);
	session_start();
	$_SESSION["Login"] = "YES";
	$_SESSION["Name"] = $dbFirstName;
	$_SESSION["EmployeeID"] = $dbEmployeeID;
	header('Location: ../Cajero/' );
}
else {
	header('Location: loginPage.html' );
}

mysql_close()
?>