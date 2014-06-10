<?php
include '../../../db_connect.php';
session_start();
$ProductCategoryID = $_POST['ProductCategoryID'];
$ProductName = $_POST['ProductName'];
$ProductPicture = $_POST['ProductPicture'];

if( empty($_POST['ProductCategoryID']) || empty($_POST['ProductName']) || empty($_POST['ProductPicture'])) {
	header('Location: RegistryProviders.html' );
}
else{
	$InsertProductQuery = mysql_query("CALL sp_Product('0','$ProductCategoryID','$ProductName','$ProductPicture');");
	mysql_close();
}
?>