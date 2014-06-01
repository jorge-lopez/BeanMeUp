<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$StockByIDQuery = mysql_query("CALL sp_Stock_Del('$ID');")or die(mysql_error());
mysql_close($connection);
	header('Location: http://' . $_SERVER['HTTP_HOST'] . '/site/Actualizar/inventario.html');

?>