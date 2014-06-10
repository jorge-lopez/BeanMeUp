<?php
include '../../../db_connect.php';
$ID = $_POST['ID'];
$ProductByIDQuery = mysql_query("CALL sp_Product_ByID('$ID');")or die(mysql_error());
while ($row = mysql_fetch_assoc($ProductByIDQuery)) {
	$ProductIDArray[] = $row;
}

$ProductData = json_encode($ProductIDArray);
echo $ProductData;
mysql_close();


?>