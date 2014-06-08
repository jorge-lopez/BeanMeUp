<?php
include '../../db_connect.php';
$EmployeeQuery = mysql_query("CALL sp_Provider_List();");

while ($row = mysql_fetch_assoc($EmployeeQuery)) {
	$Employees[] = $row;
}

$EmployeesData = json_encode($Employees);
echo $EmployeesData;
mysql_close();
?>