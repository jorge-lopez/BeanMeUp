<?php
$ID = $_POST['ID'];
$NombreProveedor = $_POST['NombreProveedor'];
$NombreCompania = $_POST['NombreCompania'];
$Email = $_POST['Email'];
$Telefono = $_POST['Telefono'];
$Celular = $_POST['Celular'];
$Direccion = $_POST['Direccion'];
$Estatus = $_POST['Active'];

if($Estatus == 'Inactive'){
	$Estatus = '1';
}
else if($Estatus == 'Active'){
	$Estatus = '';
}

if( empty($_POST['NombreProveedor']) || empty($_POST['NombreCompania']) || empty($_POST['Email']) || empty($_POST['Telefono']) || empty($_POST['Celular']) || empty($_POST['Direccion'])) {
	header('Location: RegistryProviders.html' );
}
else{
if(!filter_var($Email, FILTER_VALIDATE_EMAIL)){
	$message = "Invalid email address please type a valid email.";
}
else{
		include '../../../db_connect.php';
		$sql = mysql_query("CALL sp_Provider('$ID','$NombreProveedor','$Direccion','$Telefono','$Celular','$NombreCompania','$Email','$Estatus');")or die(mysql_error());
		mysql_close($connection);
		header('Location: http://' . $_SERVER['HTTP_HOST'] . '/site/Actualizar/proveedores.html');
}
}
?>