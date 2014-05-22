<?php
include 'db_connect.php';

  
  $IDProducto = $_POST['IdProducto'];
 
  $GetAllDrinksSP ="call sp_Product_Price_ByProductID('$IDProducto');";
  $GetAllDrinksQuery = mysql_query($GetAllDrinksSP)or die(mysql_error());
  while($row = mysql_fetch_assoc($GetAllDrinksQuery)){
       $Drinks[] = $row;
  }
  echo json_encode($Drinks);

?>