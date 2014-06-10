<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$ExpirationDate = $_POST['ExpirationDate'];
$IssueDate = $_POST['IssueDate'];
$Discount = $_POST['Discount'];
$Description = $_POST['Description'];

	$sql = mysql_query("CALL sp_Coupon('$ID','$IssueDate','$ExpirationDate','$Discount','$Description')");
	mysql_close();
	header('Location: http://' . $_SERVER['HTTP_HOST'] . '/site/Actualizar/promociones.html');

?>