<?php 
include_once G5_PATH."/dhc/level0.lib.php";
include_once G5_PATH."/dhc/level1.lib.php";

define('LEVEL0_NAME', "단위환산 트레이닝");
define('LEVEL0_NAME1', "단위환산계산 트레이닝");
define('LEVEL0_NAMES', "단위환산");
define('LEVEL1_NAME', "약물용량 트레이닝");
define('LEVEL1_NAME1', "약물용량계산 트레이닝");
define('LEVEL1_NAMES', "약물용량");

define('LEVEL0_TRINING_CNT', 5);
define('LEVEL0_TRINING_HALF', 10);
define('LEVEL0_TEST_CNT', 10);

define('LEVEL1_TRINING_CNT', 9);
define('LEVEL1_TEST_CNT', 10);//테스트 문항수 
define('LEVEL1_PASS_CNT', 3);
define('LEVEL1_LEVEL', 3);

define('LEVEL0_LEVEL', 3); //혹 인증을 위해 2가 아닌 3으로 
define('LEVEL1_LEVEL', 4);
$g5['level1_level']=array("기초", "중급", "고급");
$g5['level1_var_type']=array("고정", "분리", "범위", "나이", "약물");
$g5['level1_var_mode']=array("환경", "계산");

$g5['level1_star']=array("★☆☆","★★☆","★★★");


define('EXAM_GTT', 20);
define('EXAM_1MINUTE', 60);
define('EXAM_1HOUR', 60);
define('EXAM_1DAY', 24);

?>