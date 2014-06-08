<?php
include '../../db_connect.php';
$StockQuery = mysql_query("CALL sp_Stock_List();");

while ($row = mysql_fetch_assoc($StockQuery)) {
	$Stocks[] = $row;
}

$StockData = json_encode($Stocks);
echo $StockData;
mysql_close();
?>