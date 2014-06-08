<?php

include '../../db_connect.php';
$SelectTicketQuery = mysql_query("CALL sp_Ticket_List();");

while ($FieldNames = mysql_fetch_field($SelectTicketQuery)) {
	$FieldNamesArray[] = $FieldNames->name;
}
$FielNamesJSON = json_encode ($FieldNamesArray);
echo $FielNamesJSON;
mysql_close();


?>