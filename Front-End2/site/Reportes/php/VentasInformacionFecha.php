<?php

include '../../db_connect.php';
$StartDate = $_POST['StartDate'];
$EndDate = $_POST['EndDate'];
$SelectTicketByDateQuery = mysql_query("call sp_Ticket_List_ByDate('$StartDate', '$EndDate');");

while ($row = mysql_fetch_assoc($SelectTicketByDateQuery)) {
	$TicketsByDate[] = $row;
}
$TicketsByDateJSON = json_encode ($TicketsByDate);
echo $TicketsByDateJSON;
mysql_close();

?>