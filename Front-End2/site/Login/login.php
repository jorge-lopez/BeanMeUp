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
	$dbPositionID = $row['PositionID'];
}
if( empty($_POST['User']) && empty($_POST['Pass']) ) {
	header('Location: index.html' );
}
else if ($username == $dbEmail && $password == $dbPassword) {

	session_start();
	if($dbPositionID == "1"){
		$_SESSION["Login"] = "YES";
		$_SESSION["Name"] = $dbFirstName;
		$_SESSION["EmployeeID"] = $dbEmployeeID;
		header('Location: ../Cajero/' );
	}
	else if($dbPositionID == "2"){
		$_SESSION["Login"] = "YES";
		header('Location: ../Actualizar/index.html' );
	}
	else{
		$_SESSION["Login"] = "YES";
		header('Location: ../Reportes/index.html' );
	}

}
else {
	header('Location: index.html' );
}

mysql_close()
?>