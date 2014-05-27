<?php
if(empty($_SESSION["Login"])){
    header('Location: http://' . $_SERVER['HTTP_HOST'] . '/site/Login/');
    exit;
	}
?>