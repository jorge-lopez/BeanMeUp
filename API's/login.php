<?php
$username = $_POST['User'];
$password = $_POST['Pass'];
$connection = mysql_connect("mysql.fhero.net", "u304295155_hdcde", "hardcode123", "u304295155_bnmup") or die('Could not connect to mysql server.');
mysql_select_db("u304295155_bnmup") or die("cannot connect to the database" . mysql_error());
$SelectEmailQuery = "SELECT * FROM tblemployee WHERE Email='$username' AND Password='$password'";
$Result = mysql_query($SelectEmailQuery);

while ($row = mysql_fetch_assoc($Result)) {
	$dbEmail = $row['Email'];
	$dbPassword = $row['Password'];
}

if ($username == $dbEmail && $password == $dbPassword) {
	$encryptedPassword = md5($dbPassword);
	echo "Succesful Login\n";
	header('Location: MainPage/main.html' );
}
else {
	header('Location: index.html' );
}

mysql_close()
?>