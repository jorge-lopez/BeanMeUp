<?php
include '../../db_connect.php';
$NombreProveedor = $_POST['NombreProveedor'];
$ProviderQuery = mysql_query("CALL sp_Provider_ByNames('$NombreProveedor');");

while ($row = mysql_fetch_assoc($ProviderQuery)) {
	$Providers[] = $row;
}

$ProvidersData = json_encode($Providers);
echo $ProvidersData;
mysql_close();
?>