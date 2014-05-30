<?php
$connection = mysql_connect("mysql.fhero.net", "u304295155_hdcde", "hardcode123", "u304295155_bnmup") or die('Could not connect to mysql server.');
		mysql_select_db("u304295155_bnmup") or die("cannot connect to the database" . mysql_error());
$Email = $_POST['Email'];  
  
$result = mysql_query("CALL sp_EmailVerification('$Email');");
if(mysql_num_rows($result)>0){  
    echo 0;  
}else{  
    echo 1;  
} 
?>