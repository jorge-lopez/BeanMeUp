<?php
include '../../db_connect.php';

$NombreEmpleado = $_POST['NombreEmpleado'];

$EmployeeQuery = mysql_query("CALL sp_Employee_ByNames('$NombreEmpleado');");

while ($row = mysql_fetch_assoc($EmployeeQuery)) {
	$Employees[] = $row;
}

$EmployeesData = json_encode($Employees);
echo $EmployeesData;
mysql_close();
?>