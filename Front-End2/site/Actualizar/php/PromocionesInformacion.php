<?php
include '../../db_connect.php';

$CouponsSP = "call sp_Coupon_List();";
$CouponsQuery = mysql_query($CouponsSP);

while ($row = mysql_fetch_assoc($CouponsQuery)) {
	$Coupons[] = $row;
}

$CouponsData = json_encode($Coupons);
echo $CouponsData;
mysql_close();
?>