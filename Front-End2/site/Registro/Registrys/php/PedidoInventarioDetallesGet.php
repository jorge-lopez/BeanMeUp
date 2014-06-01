<?php
include '../../../db_connect.php';
$StockOrderDetailsID = $_POST['StockOrderDetailsID'];
$StockByIDQuery = mysql_query("CALL sp_StockOrderDetails_ByID('$StockOrderDetailsID');")or die(mysql_error());
while ($row = mysql_fetch_assoc($StockByIDQuery)) {
	$StockIDArray[] = $row;
}

$StockData = json_encode($StockIDArray);
echo $StockData;
mysql_close();


?>