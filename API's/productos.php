<?php
$connection = mysql_connect("mysql.fhero.net", "u304295155_hdcde", "hardcode123", "u304295155_bnmup") or die('Could not connect to mysql server.');
mysql_select_db("u304295155_bnmup") or die("cannot connect to the database" . mysql_error());
$GetAllDrinksSP ="call sp_Drink_List();";
$GetAllDrinksQuery = mysql_query($GetAllDrinksSP);
while($row = mysql_fetch_assoc($GetAllDrinksQuery)){
     $json[] = $row;
}

echo json_encode($json);
?>