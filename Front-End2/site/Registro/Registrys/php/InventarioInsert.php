<?php
include '../../../db_connect.php';
session_start();
$ProviderID = $_POST['ProviderID'];
$StockName = $_POST['StockName'];
$Quantity = $_POST['Quantity'];
$UnitID = $_POST['UnitID'];

$InsertStockQuery = mysql_query("CALL sp_Stock('0','$ProviderID','$StockName','$Quantity','$UnitID');");
mysql_close();
?>