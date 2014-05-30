<?php
include '../../db_connect.php';
$StockName = $_POST['StockName'];
$Quantity = $_POST['Quantity'];
if( empty($_POST['StockName']) && empty($_POST['Quantity'])) {
	header('Location: RegistryProviders.html' );
}
else{
	$sql = mysql_query("CALL sp_Stock('0','$StockName','$Quantity')");
	mysql_close();
}
?>