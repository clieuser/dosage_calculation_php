<?php
include_once('./_common.php');

//회원만 접근가능
include_once "./_member_check.php"; 

//레벨보다 적으면
if($member['mb_level'] < LEVEL1_LEVEL){
	alert(LEVEL1_NAME."은 ".LEVEL0_NAMES." 테스트를 통과한 회원만 접근가능합니다", "./level0.php");
}

$pageTitle=LEVEL1_NAME." ".$g5['level1_level'][0];

$nav_box=$nav_id=1;
$cate=0;//기초레벨
include_once "./level1.sub.php";

include_once(G5_PATH.'/tail.php');
?>