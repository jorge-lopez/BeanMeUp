<?php
$ID = $_POST['ID'];
$FirstName = $_POST['FName'];
$LastName = $_POST['LName'];
$Phone = $_POST['Telephone'];
$Email = $_POST['Email'];
$Address = $_POST['Address'];
$Password = $_POST['Password'];
$VPassword = $_POST['VPassword'];
$Selected_radio = $_POST['Gender'];
$Salary = $_POST['Salary'];
$Registrar = $_POST['Registrar'];
$Estatus = $_POST['Estatus'];

if($Selected_radio == 'Male'){
	$Selected_radio = '';
}
else if($Selected_radio == 'Female'){
	$Selected_radio = '0';
}

if($Registrar == 'Cajero'){
	$Registrar = '1';
}
else if($Registrar == 'Supervisor'){
	$Registrar ='2';
}
else{
	$Registrar = '3';
}

if($Estatus == 'Activo'){
	$Estatus = '0';

}
else if($Estatus == 'Inactivo'){
	$Estatus = '';
}
if( empty($_POST['FName']) && empty($_POST['LName']) && empty($_POST['Telephone']) && empty($_POST['Email']) && empty($_POST['Address']) && empty($_POST['Password']) && empty($_POST['VPassword']) && empty($_POST['Gender']) && empty($_POST['Salary']) && empty($_POST['Registro'])) {
	header('Location: RegistryEmployees.html' );
}
else{
if(!filter_var($Email, FILTER_VALIDATE_EMAIL)){
	$message = "Invalid email address please type a valid email.";
}
else{
	if($Password == $VPassword){
		include '../../../db_connect.php';
		$sql = mysql_query("CALL sp_Employee('$ID','$Registrar','$FirstName','$LastName','$Selected_radio','$Phone','$Address','$Email','$Password','$Salary','$Estatus');")or die(mysql_error());
		mysql_close($connection);
	}
	else{
		header('Location: RegistryEmployees.html' );
	}
}
}
?>