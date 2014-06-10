<?php
include '../../../db_connect.php';
session_start();
$ID = $_POST['ID'];
$dbEmployeeID = $_SESSION["EmployeeID"];
$ProviderID = $_POST['ProviderID'];
$StockOrderCost = $_POST['StockOrderCost'];

if( empty($_SESSION['ID']) && empty($_POST['dbEmployeeID']) && empty($_POST['ProviderID']) && empty($_POST['StockOrderCost'])) {
	header('Location: RegistryProviders.html' );
}
else{
	$InsertStockOrderQuery = mysql_query("CALL sp_StockOrder('$ID','$dbEmployeeID','$ProviderID','$StockOrderCost');")
	mysql_close();
	include '../../../db_connect.php';
	$SelectStockOrderID = mysql_query('SELECT StockOrderID FROM tblStockOrder ORDER BY StockOrderID DESC LIMIT 1') or die (mysql_error());
	$row = mysql_fetch_assoc($SelectStockOrderID);
	$dbStockOrderID = $row['StockOrderID'];
	mysql_close();
	include '../../db_connect.php';
	$InsertStockOrderDetailQuery = mysql_query("CALL sp_StockOrderDetail('$ID','$dbStockOrderID','$StockID','$Quantity');") or die (mysql_error());
	mysql_close();
}
?>