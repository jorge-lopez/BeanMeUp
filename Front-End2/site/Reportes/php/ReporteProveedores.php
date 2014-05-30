<?php

include '../../db_connect.php';

$SelectProviderSP = "call sp_Provider_List();";
$SelectProviderQuery = mysql_query($SelectProviderSP);

while ($row = mysql_fetch_assoc($SelectProviderQuery)) {
	$Providers[] = $row;
}
$ProvidersJSON = json_encode ($Providers);
echo $ProvidersJSON;
mysql_close();

?>