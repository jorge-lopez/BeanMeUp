<?php

  $connection = mysql_connect("mysql.fhero.net", "u304295155_hdcde", "hardcode123", "u304295155_bnmup")
    or die('Could not connect to mysql server.');
  mysql_select_db("u304295155_bnmup") 
    or die("cannot connect to the database" . mysql_error());
 
  
  $IDProducto = $_POST['IdProducto'];



 
  $GetAllDrinksSP ="call sp_Product_Price_ByProductID('$IDProducto');";
  $GetAllDrinksQuery = mysql_query($GetAllDrinksSP)or die(mysql_error());
  while($row = mysql_fetch_assoc($GetAllDrinksQuery)){
       $Drinks[] = $row;
  }
echo json_encode($Drinks);

?>