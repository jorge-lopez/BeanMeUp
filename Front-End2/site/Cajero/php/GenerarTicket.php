<?php
include '../../db_connect.php';
$Ticket = $_POST['ticket'];
$TicketArray = json_decode($Ticket,true);
?>