<?php
include '../../../db_connect.php';
session_start();
$ID = $_POST['ID'];
$ProductID = $_POST['ProductID'];
$SizeID = $_POST['SizeID'];
$StockID = $_POST['StockID'];
$Quantity = $_POST['Quantity'];

if( empty($_POST['ID']) || empty($_POST['ProductID']) || empty($_POST['SizeID']) || empty($_POST['StockID']) || empty($_POST['Quantity'])) {
	header('Location: RegistryProviders.html' );
}
else{
	$InsertProductQuery = mysql_query("CALL sp_Product('$ID','$ProductID','$SizeID','$StockID','$Quantity');");
	mysql_close();
}
?>