<?php
include '../../db_connect.php';
session_start();
$Ticket = $_POST['ticket'];
$TicketArray = json_decode($Ticket,true);
$Precio = $_POST['detallesTotal'];
$dbEmployeeID = $_SESSION["EmployeeID"];
$InsertTicketSP ="call sp_Ticket('0','$dbEmployeeID','100.00');";
$InsertTicketQuery = mysql_query($InsertTicketSP) or die(mysql_error());;
mysql_close();

include '../../db_connect.php';
$SelectTicketID = mysql_query('SELECT TicketID FROM tblTicket ORDER BY TicketID DESC LIMIT 1') or die (mysql_error());
$row = mysql_fetch_assoc($SelectTicketID);
$dbTicketID = $row['TicketID'];
mysql_close();

foreach($TicketArray as $item) { //foreach element in $arr
include '../../db_connect.php';
$ProductId = $item['ProductId'];
$SizeId = $item['SizeId'];
$Cantidad = $item['Cantidad'];
$InsertTicketDetailSP ="call sp_TicketDetail('0','$dbTicketID','$ProductId','$SizeId','$Cantidad');";
$InsertTicketDetailQuery = mysql_query($InsertTicketDetailSP) or die(mysql_error());;

    echo "ProductId : " . $item['ProductId'] 
    	. ", SizeId : " . $item['SizeId'] 
		. ", Cantidad : " . $item['Cantidad'] . "\n"; //etc
}
mysql_close();

?>