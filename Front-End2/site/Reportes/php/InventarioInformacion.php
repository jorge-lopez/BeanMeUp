<?php
include '../../db_connect.php';

$StockSP = "call sp_Stock_List();";
$StockQuery = mysql_query($StockSP);

while ($row = mysql_fetch_assoc($StockQuery)) {
	$Stocks[] = $row;
}

$StockData = json_encode($Stocks);
echo $StockData;
mysql_close();
?>