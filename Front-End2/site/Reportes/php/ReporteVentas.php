<?php

include '../../db_connect.php';

$SelectTicketSP = "call sp_Ticket_List();";
$SelectTicketQuery = mysql_query($SelectTicketSP);

while ($row = mysql_fetch_assoc($SelectTicketQuery)) {
	$Tickets[] = $row;
}
$TicketsJSON = json_encode ($Tickets);
echo $TicketsJSON;
mysql_close();

?>