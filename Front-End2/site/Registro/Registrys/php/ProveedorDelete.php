<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$ProviderByIDQuery = mysql_query("CALL sp_Provider_Del('$ID');")or die(mysql_error());
mysql_close($connection);
	header('Location: http://' . $_SERVER['HTTP_HOST'] . '/site/Actualizar/proveedores.html');

?>