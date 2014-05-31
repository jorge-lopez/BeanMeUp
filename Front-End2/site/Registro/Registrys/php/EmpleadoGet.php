<?php
include '../../db_connect.php';
$ID = $_POST['ID'];
$EmployeeByIDQuery = mysql_query("CALL sp_Employee_ByID('$ID');")or die(mysql_error());
while ($row = mysql_fetch_assoc($EmployeeByIDQuery)) {
	$EmployeeIDArray[] = $row;
}

$EmployeeData = json_encode($EmployeeIDArray);
echo $EmployeeData;
mysql_close();


?>