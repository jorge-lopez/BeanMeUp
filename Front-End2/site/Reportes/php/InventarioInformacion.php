<?php
include '../../db_connect.php';

$EmployeeSP = "call sp_Provider_List();";
$EmployeeQuery = mysql_query($EmployeeSP);

while ($row = mysql_fetch_assoc($EmployeeQuery)) {
	$Employees[] = $row;
}

$EmployeesData = json_encode($Employees);
echo $EmployeesData;
mysql_close();
?>