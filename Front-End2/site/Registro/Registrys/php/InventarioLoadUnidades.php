<?php
include '../../../db_connect.php';

$UnitQuery = mysql_query("CALL sp_Unit_List();");

while ($row = mysql_fetch_assoc($UnitQuery)) {
	$Units[] = $row;
}

$UnitData = json_encode($Units);
echo $UnitData;
mysql_close();
?>