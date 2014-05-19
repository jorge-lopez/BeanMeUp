<?php

  $connection = mysql_connect("mysql.fhero.net", "u304295155_hdcde", "hardcode123", "u304295155_bnmup")
    or die('Could not connect to mysql server.');
  mysql_select_db("u304295155_bnmup") 
    or die("cannot connect to the database" . mysql_error());
  session_start();

  if(empty($_SESSION["Login"])){
    header('Location: http://' . $_SERVER['HTTP_HOST'] . '/Login/loginPage.html');
    exit;
  }
  $GetAllDrinksSP ="call sp_Product_ByCategoryID('1');";
  $GetAllDrinksQuery = mysql_query($GetAllDrinksSP);
  while($row = mysql_fetch_assoc($GetAllDrinksQuery)){
       $Drinks[] = $row;
  }
echo json_encode($Drinks);

?>