<?php
include '../../db_connect.php';
$GetProviders = mysql_query("CALL sp_Provider_Info();");
while($row = mysql_fetch_assoc($GetProviders)){
       $Providers[] = $row['ProviderID'];
       $Providers[] = $row['ProviderCompany'];
  }
$Providers_js = json_encode($Providers);
?>