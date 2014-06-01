<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$CouponByIDQuery = mysql_query("CALL sp_Coupon_ByID('$ID');")or die(mysql_error());
while ($row = mysql_fetch_assoc($CouponByIDQuery)) {
	$CouponIDArray[] = $row;
}

$CouponData = json_encode($CouponIDArray);
echo $CouponData;
mysql_close();


?>