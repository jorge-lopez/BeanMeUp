<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$EmployeeByIDQuery = mysql_query("CALL sp_Employee_Del('$ID');")or die(mysql_error());
mysql_close($connection);
	header('Location: http://' . $_SERVER['HTTP_HOST'] . '/site/Actualizar/empleados.html');

?>