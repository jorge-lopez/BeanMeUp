<?php

include '../../db_connect.php';

$SelectTicketSP = "call sp_Ticket_List();";
$SelectTicketQuery = mysql_query($SelectTicketSP);

while ($FieldNames = mysql_fetch_field($SelectTicketQuery)) {
	$FieldNamesArray[] = $FieldNames->name;
}
$FielNamesJSON = json_encode ($FieldNamesArray);
echo $FielNamesJSON;
mysql_close();


?>