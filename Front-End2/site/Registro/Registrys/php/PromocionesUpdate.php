<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$ExpirationDate = $_POST['ExpirationDate'];
// $IssueDate = $_POST['IssueDate'];
$Discount = $_POST['Discount'];
$Description = $_POST['Description'];
if( empty($_POST['ExpirationDate']) && empty($_POST['Discount']) && empty($_POST['Description'])) {
	header('Location: RegistryProviders.html' );
}
else{
	// $sql = mysql_query("CALL sp_Coupon('0','$IssueDate,'$ExpirationDate','$Discount','$Description')");
	$sql = mysql_query("CALL sp_Coupon('$ID','$ExpirationDate','$Discount','$Description')")or die(mysql_error());
	mysql_close();
	header('Location: http://' . $_SERVER['HTTP_HOST'] . '/site/Actualizar/promociones.html');
}
?>