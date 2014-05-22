<?php
include '../db_connect.php';
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
	$Selected_radio = '0';
}
else if($Selected_radio == 'Female'){
	$Selected_radio ='1';
}

if($Registrar == 'Cajero'){
	$Registrar = '0';
}
else if($Registrar == 'Administrador'){
	$Registrar ='1';
}
$VerifyEmail ="CALL sp_EmailVerification('$Email');";
$VerifyEmailQuery = mysql_query($VerifyEmail);
$numResults = mysql_num_rows($VerifyEmailQuery);
if( empty($_POST['FName']) && empty($_POST['LName']) && empty($_POST['Telephone']) && empty($_POST['Email']) && empty($_POST['Address']) && empty($_POST['Gender'])) {
	header('Location: RegistryEmployees.html' );
}
else{
if(!filter_var($Email, FILTER_VALIDATE_EMAIL)){
	$message = "Invalid email address please type a valid email.";
}
else if($numResults >= 1){
	echo 0;
	mysql_close($connection);
}
else if($numResults == 0){
	echo 1;
	mysql_close($connection);
}
else{
	if($Password == $VPassword){
		$connection = mysql_connect("mysql.fhero.net", "u304295155_hdcde", "hardcode123", "u304295155_bnmup") or die('Could not connect to mysql server.');
		mysql_select_db("u304295155_bnmup") or die("cannot connect to the database" . mysql_error());
		$sql = mysql_query("CALL sp_Employee('0','$Registrar','$FirstName','$LastName','$Selected_radio','$Telephone','$Address','$Email','$Password','$Salary')")or die(mysql_error());
		mysql_close($connection);
	}
	else{
		header("Location: registertestfail.php");
	}
}
}
?>