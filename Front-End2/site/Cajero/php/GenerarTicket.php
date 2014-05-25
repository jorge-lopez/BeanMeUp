<?php
include '../../db_connect.php';
$Ticket = $_POST['ticket'];
$TicketArray = json_decode($Ticket,true);
$Precio = $_POST['detallesTotal'];


foreach($TicketArray as $item) { //foreach element in $arr
    echo "ProductId : " . $item['ProductId'] 
    	. ", SizeId : " . $item['SizeId'] 
		. ", Cantidad : " . $item['Cantidad'] . "\n"; //etc
}
?>