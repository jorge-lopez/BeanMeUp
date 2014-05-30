<?php
include '../../db_connect.php';
$ExpirationDate = $_POST['ExpirationDate'];
$Discount = $_POST['Discount'];
$Description = $_POST['Description'];
$sql = mysql_query("CALL sp_Coupon('0','$ExpirationDate','$Discount','$Description')");
mysql_close();

?>