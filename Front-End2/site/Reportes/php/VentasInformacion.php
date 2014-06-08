<?php

include '../../db_connect.php';
$SelectTicketQuery = mysql_query("CALL sp_Ticket_List();");

while ($row = mysql_fetch_assoc($SelectTicketQuery)) {
	$Tickets[] = $row;
}
$TicketsJSON = json_encode ($Tickets);
echo $TicketsJSON;
mysql_close();

?>