<?php

include '../../db_connect.php';
$SelectEmployeeFieldQuery = mysql_query("CALL sp_Provider_List();");

while ($FieldNames = mysql_fetch_field($SelectEmployeeFieldQuery)) {
	$FieldNamesArray[] = $FieldNames->name;
}
$FielNamesJSON = json_encode ($FieldNamesArray);
echo $FielNamesJSON;
mysql_close();

?>