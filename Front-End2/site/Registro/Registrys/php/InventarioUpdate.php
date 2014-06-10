<?php
include '../../../db_connect.php';
session_start();
$ID = $_POST['ID'];
$ProviderID = $_POST['ProviderID'];
// $StockName = $_POST['StockName'];
// $Quantity = $_POST['Quantity'];
$UnitID = $_POST['UnitID'];

$InsertStockQuery = mysql_query("CALL sp_Stock('$ID','$StockName','$UnitID');");
mysql_close();
?>