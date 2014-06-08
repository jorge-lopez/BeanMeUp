<?php

include '../../db_connect.php';

$ID = $_POST['ID'];
$SelectTicketDetailByIDQuery = mysql_query("call sp_TicketDetail_ByTicketID('$ID');");

while ($row = mysql_fetch_assoc($SelectTicketDetailByIDQuery)) {
	$TicketDetailByID[] = $row;
}
$TicketDetailByIDJSON = json_encode ($TicketDetailByID);
echo $TicketDetailByIDJSON;
mysql_close();

?>