<?php
include '../../db_connect.php';
$GetUnidades = mysql_query("CALL sp_Unit_List();");
while($row = mysql_fetch_assoc($GetUnidades)){
       $Unidades[] = $row;
  }
$Unidades_js = json_encode($Unidades);
?>