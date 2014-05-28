<?php
include '../../db_connect.php';

$SelectEmployeeFieldSP = "call sp_Employee_List();";
$SelectEmployeeFieldQuery = mysql_query($SelectEmployeeFieldSP);

while ($FieldNames = mysql_fetch_field($SelectEmployeeFieldQuery)) {
	$FieldNamesArray[] = $FieldNames->name;
}

$FieldNamesJson = json_encode($FieldNamesArray);
echo $FieldNamesJson;
mysql_close();
include '../../db_connect.php';

$EmployeeSP = "call sp_Employee_List();";
$EmployeeQuery = mysql_query($EmployeeSP);

while ($row = mysql_fetch_assoc($EmployeeQuery)) {
	$Employees[] = $row;
}

$EmployeesData = json_encode($Employees);
echo $EmployeesData;
mysql_close();
?>