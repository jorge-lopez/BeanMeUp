<?php
include '../../../db_connect.php';
session_start();
$ID = $_POST['ID'];
$ProviderID = $_POST['ProviderID'];
$StockName = $_POST['StockName'];
$Quantity = $_POST['Quantity'];
$UnitID = $_POST['UnitID'];

if( empty($_POST['StockName']) && empty($_POST['Quantity'])) {
	header('Location: RegistryProviders.html' );
}
else{
	$InsertStockQuery = mysql_query("CALL sp_Stock('$ID','$ProviderID','$StockName','$Quantity','$UnitID');");
	mysql_close();
}
?>