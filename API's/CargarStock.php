<?php
include '../../db_connect.php';
$GetStock = mysql_query("CALL sp_Stock_List();");
while($row = mysql_fetch_assoc($GetStock)){
       $Stock[] = $row;
  }
$Stock_js = json_encode($Stock);
?>