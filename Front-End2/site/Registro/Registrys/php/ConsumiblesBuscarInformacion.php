<?php
include '../../../db_connect.php';

$NombreConsumible = $_POST['NombreConsumible'];

$ConsumibleQuery = mysql_query("CALL sp_Stock_ByNames('$NombreConsumible');");

while ($row = mysql_fetch_assoc($ConsumibleQuery)) {
	$Consumible[] = $row;
}

$ConsumibleData = json_encode($Consumible);
echo $ConsumibleData;
mysql_close();
?>