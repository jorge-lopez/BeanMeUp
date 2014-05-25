<?php
session_start();
$dbemployeeID = $_SESSION["EmployeeID"];
echo $dbemployeeID;
?>