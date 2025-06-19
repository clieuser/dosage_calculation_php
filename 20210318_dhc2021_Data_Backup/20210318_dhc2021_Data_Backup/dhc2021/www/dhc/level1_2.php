<?php
include_once('./_common.php');
$pageTitle=LEVEL1_NAME;

include_once "./_member_check.php"; 


//레벨보다 적으면
if($member['mb_level'] < LEVEL1_LEVEL){
	alert(LEVEL1_NAME."은 ".LEVEL0_NAMES." 테스트를 통과한 회원만 접근가능합니다", "./level0.php");
}
if($member['mb_level'] == LEVEL1_LEVEL){
	//현재 진행중 회원이면
	if($member['mb_level1']<1){
		alert(LEVEL1_NAME." ".$g5['level1_level'][1]." ".LEVEL1_NAME." ".$g5['level1_level'][0]." 과정을 마쳐야 트레이닝 받으실수 있습니다.", "./level1.php");
	}
}

$pageTitle=LEVEL1_NAME." ".$g5['level1_level'][1];


$nav_box=$nav_id=2;
$cate=1;//중급레벨
include_once "./level1.sub.php";

include_once(G5_PATH.'/tail.php');
?>