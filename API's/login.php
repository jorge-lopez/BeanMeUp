<?php
$username = $_POST['User'];
$password = $_POST['Pass'];
$connection = mysql_connect("mysql.fhero.net", "u304295155_hdcde", "hardcode123", "u304295155_bnmup") or die('Could not connect to mysql server.');
mysql_select_db("u304295155_bnmup") or die("cannot connect to the database" . mysql_error());
$SelectEmailQuery = "SELECT * FROM tblemployee WHERE Email='$username' AND Password='$password'";
$Result = mysql_query($SelectEmailQuery);
// $Result ="call sp_login('".$username."','".$password."');";
// $query = mysql_query($Result);
//$Result = mysql_query("CALL sp_login('admin@gmail.com','12345')");
while ($row = mysql_fetch_assoc($Result)) {
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
	$_SESSION["Name"] = $dbFirstName;
	header('Location: MainPage/main.html' );
}
else {
	header('Location: index.html' );
}

mysql_close()
?>