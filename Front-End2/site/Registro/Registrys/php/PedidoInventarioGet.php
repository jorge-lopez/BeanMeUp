<?php
include '../../../db_connect.php';
$StockOrderID = $_POST['StockOrderID'];
$StockByIDQuery = mysql_query("CALL sp_StockOrder_ByID('$StockOrderID');")or die(mysql_error());
while ($row = mysql_fetch_assoc($StockByIDQuery)) {
	$StockIDArray[] = $row;
}

$StockData = json_encode($StockIDArray);
echo $StockData;
mysql_close();


?>