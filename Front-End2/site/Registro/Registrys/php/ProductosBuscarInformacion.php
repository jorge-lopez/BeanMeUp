<?php
include '../../../db_connect.php';

$NombreProducto = $_POST['NombreProducto'];

$ProductQuery = mysql_query("CALL sp_Product_ByNames('$NombreProducto');");

while ($row = mysql_fetch_assoc($ProductQuery)) {
	$Product[] = $row;
}

$ProductData = json_encode($Product);
echo $ProductData;
mysql_close();
?>