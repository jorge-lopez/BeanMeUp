<?php
include '../../../db_connect.php';
session_start();
$SizeName = $_POST['SizeName'];
$SizeVolumeML = $_POST['SizeVolumeML'];

if( empty($_POST['SizeName']) || empty($_POST['SizeVolumeML'])) {
	header('Location: RegistryProviders.html' );
}
else{
	$InsertProductQuery = mysql_query("CALL sp_Product('0','$SizeName','$SizeVolumeML');");
	mysql_close();
}
?>