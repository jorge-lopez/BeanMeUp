<?php
include '../../db_connect.php';
session_start();
$Ticket = $_POST['ticket'];
$TicketArray = json_decode($Ticket,true);
$Precio = $_POST['detallesTotal'];
$dbEmployeeID = $_SESSION["EmployeeID"];

foreach($TicketArray as $item) { //foreach element in $arr
    echo "ProductId : " . $item['ProductId'] 
    	. ", SizeId : " . $item['SizeId'] 
		. ", Cantidad : " . $item['Cantidad'] . "\n"; //etc
}
?>