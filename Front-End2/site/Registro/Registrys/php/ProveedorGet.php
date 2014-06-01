<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$ProviderByIDQuery = mysql_query("CALL sp_Provider_ByID('$ID');")or die(mysql_error());
while ($row = mysql_fetch_assoc($ProviderByIDQuery)) {
	$ProviderIDArray[] = $row;
}

$ProviderData = json_encode($ProviderIDArray);
echo $ProviderData;
mysql_close();


?>