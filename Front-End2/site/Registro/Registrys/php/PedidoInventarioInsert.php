<?php
include '../../../db_connect.php';
session_start();
$dbEmployeeID = $_SESSION["EmployeeID"];
$ProviderID = $_POST['ProviderID'];
$StockOrderDate = $_POST['StockOrderDate'];
$StockOrderCost = $_POST['StockOrderCost'];
$StockID = $_POST['StockID'];
$Quantity = $_POST['Quantity'];

if( empty($_POST['StockOrderDate']) && empty($_POST['StockOrderCost'])) {
	header('Location: RegistryProviders.html' );
}
else{
	$InsertStockOrderQuery = mysql_query("CALL sp_Stock('0','$dbEmployeeID','$ProviderID','$StockOrderCost','$StockOrderDate');")
	mysql_close();
	include '../../../db_connect.php';
	$SelectStockOrderID = mysql_query('SELECT StockOrderID FROM tblStockOrder ORDER BY StockOrderID DESC LIMIT 1') or die (mysql_error());
	$row = mysql_fetch_assoc($SelectStockOrderID);
	$dbStockOrderID = $row['StockOrderID'];
	mysql_close();
	include '../../db_connect.php';
	$InsertStockOrderDetailQuery = mysql_query("CALL sp_StockOrderDetail('0','$dbStockOrderID','$StockID','$Quantity');") or die (mysql_error());
	mysql_close();
}
?>