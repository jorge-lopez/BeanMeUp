<?php
include 'db_connect.php';
$SelectEmployeeSP = "call sp_Employee_List();";
$SelectEmployeeQuery = mysql_query($SelectEmployeeSP);
while ($FieldNames = mysql_fetch_field($SelectEmployeeQuery)){
	$FieldNamesArray[] = $FieldNames->name;
}
$FieldNamesJson = json_encode($FieldNamesArray);
echo $FieldNamesJson;
mysql_close();
?>