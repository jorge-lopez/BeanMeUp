<?php
include '../../../db_connect.php';

$ProviderQuery = mysql_query("CALL sp_Provider_List();");

while ($row = mysql_fetch_assoc($ProviderQuery)) {
	$Providers[] = $row;
}

$ProviderData = json_encode($Providers);
echo $ProviderData;
mysql_close();
?>