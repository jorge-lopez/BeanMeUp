<?php

include '../../db_connect.php';

$SelectStockFieldSP = "call sp_Stock_List();";
$SelectStockFieldQuery = mysql_query($SelectStockFieldSP);

while ($StockFieldNames = mysql_fetch_field($SelectStockFieldQuery)) {
	$StockFieldNamesArray[] = $StockFieldNames->name;
}
$StockFieldNamesJSON = json_encode ($StockFieldNamesArray);
echo $StockFieldNamesJSON;
mysql_close();

?>