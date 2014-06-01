<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$StockByIDQuery = mysql_query("CALL sp_Stock_ByID('$ID');")or die(mysql_error());
while ($row = mysql_fetch_assoc($StockByIDQuery)) {
	$StockIDArray[] = $row;
}

$StockData = json_encode($StockIDArray);
echo $StockData;
mysql_close();


?>