<?php
include '../../db_connect.php';
$StockName = $_POST['StockName'];
$Quantity = $_POST['Quantity'];
$sql = mysql_query("CALL sp_Stock('0','$StockName','$Quantity')");
mysql_close();

?>