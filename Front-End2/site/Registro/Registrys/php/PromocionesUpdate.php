<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$ExpirationDate = $_POST['ExpirationDate'];
$IssueDate = $_POST['IssueDate'];
$Discount = $_POST['Discount'];
$Description = $_POST['Description'];
if( empty($_POST['ExpirationDate']) && empty($_POST['Discount']) && empty($_POST['Description'])) {
	header('Location: RegistryProviders.html' );
}
else{
	$sql = mysql_query("CALL sp_Coupon('$ID','$IssueDate','$ExpirationDate','$Discount','$Description')");
	mysql_close();
}
?>