<?php
include '../../db_connect.php';
$CouponsQuery = mysql_query("CALL sp_Coupon_List();");

while ($row = mysql_fetch_assoc($CouponsQuery)) {
	$Coupons[] = $row;
}

$CouponsData = json_encode($Coupons);
echo $CouponsData;
mysql_close();
?>