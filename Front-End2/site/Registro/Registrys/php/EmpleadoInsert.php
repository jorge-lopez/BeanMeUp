<?php

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
if( empty($_POST['FName']) || empty($_POST['LName']) || empty($_POST['Telephone']) || empty($_POST['Email']) || empty($_POST['Address']) || empty($_POST['Password']) || empty($_POST['VPassword']) || empty($_POST['Gender']) || empty($_POST['Salary']) || empty($_POST['Registro'])) {
	header('Location: RegistryEmployees.html' );
}
else{
if(!filter_var($Email, FILTER_VALIDATE_EMAIL)){
	$message = "Invalid email address please type a valid email.";
}
else{
	if($Password == $VPassword){
		include '../../../db_connect.php';
		$sql = mysql_query("CALL sp_Employee('0','$Registrar','$FirstName','$LastName','$Selected_radio','$Phone','$Address','$Email','$Password','$Salary','0');")or die(mysql_error());
		header('Location: http://' . $_SERVER['HTTP_HOST'] . '/site/Actualizar/empleados.html');
		mysql_close($connection);
	}
	else{
		header('Location: RegistryEmployees.html' );
	}
}
}
?>