<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$StockOrderByIDQuery = mysql_query("CALL sp_StockOrder_Del('$ID');")or die(mysql_error());
mysql_close($connection);
include '../../../db_connect.php';
$StockOrderDetailsByIDQuery = mysql_query("CALL sp_StockOrderDetails_Del('$ID');")or die(mysql_error());
mysql_close($connection);
	header('Location: http://' . $_SERVER['HTTP_HOST'] . '/site/Actualizar/inventario.html');

?>