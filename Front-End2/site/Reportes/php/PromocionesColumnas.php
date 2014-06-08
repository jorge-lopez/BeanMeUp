<?php

include '../../db_connect.php';
$SelectCouponsFieldQuery = mysql_query("CALL sp_Coupon_List();");

while ($FieldNames = mysql_fetch_field($SelectCouponsFieldQuery)) {
	$FieldNamesArray[] = $FieldNames->name;
}
$FieldNamesJSON = json_encode ($FieldNamesArray);
echo $FieldNamesJSON;
mysql_close();

?>