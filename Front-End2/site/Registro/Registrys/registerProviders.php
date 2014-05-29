<?php

$NombreProveedor = $_POST['NombreProveedor'];
$NombreCompania = $_POST['NombreCompania'];
$Email = $_POST['Email'];
$Telefono = $_POST['Telefono'];
$Celular = $_POST['Ceular'];
$Direccion = $_POST['Direccion'];

if( empty($_POST['FName']) && empty($_POST['LName']) && empty($_POST['Telephone']) && empty($_POST['Email']) && empty($_POST['Address']) && empty($_POST['Password']) && empty($_POST['VPassword']) && empty($_POST['Gender']) && empty($_POST['Salary']) && empty($_POST['Registro'])) {
	header('Location: RegistryEmployees.html' );
}
else{
if(!filter_var($Email, FILTER_VALIDATE_EMAIL)){
	$message = "Invalid email address please type a valid email.";
}
else{
	if($Password == $VPassword){
		include '../../db_connect.php';
		$sql = mysql_query("CALL sp_Employee('0','$Registrar','$FirstName','$LastName','$Selected_radio','$Phone','$Address','$Email','$Password','$Salary');")or die(mysql_error());
		echo "Se agrego";
		mysql_close($connection);
	}
	else{
		header('Location: RegistryEmployees.html' );
	}
}
}
?>