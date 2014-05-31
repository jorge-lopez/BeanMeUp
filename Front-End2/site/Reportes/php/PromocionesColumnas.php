<?php

include '../../db_connect.php';

$SelectCouponsFieldSP = "call sp_Coupon_List();";
$SelectCouponsFieldQuery = mysql_query($SelectCouponsFieldSP);

while ($FieldNames = mysql_fetch_field($SelectCouponsFieldQuery)) {
	$FieldNamesArray[] = $FieldNames->name;
}
$FieldNamesJSON = json_encode ($FieldNamesArray);
echo $FieldNamesJSON;
mysql_close();

?>