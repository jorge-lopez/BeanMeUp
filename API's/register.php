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
$VerifyEmail ="call sp_EmailVerification('$Email');";
$VerifyEmailQuery = mysql_query($VerifyEmail);
$numResults = mysqli_num_rows($VerifyEmailQuery);
//SP registro

if(!filter_var($Email, FILTER_VALIDATE_EMAIL)){
	$message = "Invalid email address please type a valid email.";
}
else if($numResults >= 1){
	$message = $Email." Email already exist.";
}
else{
	if($Password == $VPassword){
		//Query insert a base de datos
	}
	else{
		//error
	}
	
}
?>