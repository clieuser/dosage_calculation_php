<?php
include_once "./_common.php";

if($wType=="level0_load"){
	include_once "./level0.exam.php";
	exit();
}
else if($wType=="level0_check"){
	include_once "./level0.check.php";
	exit();
}
else if($wType=="level0_test"){
	include_once "./level0_test.check.php";
	exit();
}
else if($wType=="level1_load"){
	include_once "./level1.exam.php";
	exit();
}
else if($wType=="level1_check"){
	include_once "./level1.check.php";
	exit();
}
?>