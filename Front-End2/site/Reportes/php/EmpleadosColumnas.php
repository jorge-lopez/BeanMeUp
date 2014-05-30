<?php

include '../../db_connect.php';

$SelectEmployeeFieldSP = "call sp_Employee_List();";
$SelectEmployeeFieldQuery = mysql_query($SelectEmployeeFieldSP);

while ($FieldNames = mysql_fetch_field($SelectEmployeeFieldQuery)) {
	$FieldNamesArray[] = $FieldNames->name;
}
$FielNamesJSON = json_encode ($FieldNamesArray);
echo $FielNamesJSON;
mysql_close();

?>