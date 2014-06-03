<?php
include 'db_connect.php';
$GetProviders = mysql_query("CALL sp_Provider_List();");
while($row = mysql_fetch_assoc($GetProviders)){
       $Providers[] = $row;
  }
$Providers_js = json_encode($Providers);
?>