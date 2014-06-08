<?php

include '../../db_connect.php';
$SelectStockFieldQuery = mysql_query("CALL sp_Stock_List();");

while ($StockFieldNames = mysql_fetch_field($SelectStockFieldQuery)) {
	$StockFieldNamesArray[] = $StockFieldNames->name;
}
$StockFieldNamesJSON = json_encode ($StockFieldNamesArray);
echo $StockFieldNamesJSON;
mysql_close();

?>