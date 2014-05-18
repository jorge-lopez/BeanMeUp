<?php
$FirstName = $_POST['FName'];
$LastName = $_POST['LName'];
$Phone = $_POST['Telephone'];
$Email = $_POST['Email'];
$Address = $_POST['Address'];
$Password = $_POST['Password'];
$VPassword = $_POST['VPassword'];
$Male_status = 'unchecked';
$Female_status = 'unchecked';
$Selected_radio = $_POST['Gender'];

if($Selected_radio == 'male'){
	$Male_status = 'checked';
}
else if($Selected_radio == 'female'){
	$Female_status ='checked';
}

$connection = mysql_connect("mysql.fhero.net", "u304295155_hdcde", "hardcode123", "u304295155_bnmup") or die('Could not connect to mysql server.');
mysql_select_db("u304295155_bnmup") or die("cannot connect to the database" . mysql_error());
$VerifyEmail ="CALL sp_EmailVerification('$Email');";
$VerifyEmailQuery = mysql_query($VerifyEmail);
$numResults = mysqli_num_rows($VerifyEmailQuery);

if( empty($_POST['FName']) && empty($_POST['LName'] && empty($_POST['Telephone'] && empty($_POST['Email'] && empty($_POST['Address'] && empty($_POST['Password'] && empty($_POST['VPassword'] && empty($_POST['Gender']) ) {
	header('Location: Registry2.html' );
}
else{
if(!filter_var($Email, FILTER_VALIDATE_EMAIL)){
	$message = "Invalid email address please type a valid email.";
}
else if($numResults >= 1){
	$message = $Email." Email already exist.";
}
else{
	if($Password == $VPassword){
		mysql_query(CALL sp_Employee('0','$PositionID','$FirstName','$LastName','$Gender','$Telephone','$Address','$Email','$Password','$Salary'));
		//$InsertEmployeeQuery = mysql_query($InsertEmployee);
	}
	else{
		//error
	}
}
}
?>