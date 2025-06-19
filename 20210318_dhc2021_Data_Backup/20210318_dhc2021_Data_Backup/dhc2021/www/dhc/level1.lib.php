<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가
/****************************
level1
****************************/
// 이 파일은 새로운 파일 생성시 반드시 포함되어야 함

//level1 backup data 를 구한다
function exam_level1_data($cate=0, $pr_id=0){
	//최신내용을 찾는다
	global $member; 
	$sql = "select * from exam_level1
	where mb_id='".$member['mb_id']."'
	AND pr_cate='{$cate}'  
	".(($pr_id)?" AND pr_id='{$pr_id}'":" order by pr_id desc  ") ;
	 
	$row=sql_fetch($sql);
	return $row;
}


function exam_level1_wr_id($cate=0){
	$sql = "select wr_id  
	from g5_write_level1
	where ca_name='사용'
	AND wr_1<='{$cate}' ";
	$result=sql_query($sql); 
	while($row=sql_fetch_array($result)){
		$prow[]=$row['wr_id'];
	}
	return $prow; 
}


//테스트를 등록한다.
function exam_level1_create($cate=0){
	global $member; 
	$sql = " insert into exam_level1 set
	pr_id = '' , 
	mb_id= '".$member['mb_id']."' ,
	pr_cate='{$cate}' , 
	pr_last = '".G5_TIME_YMDHIS."', 
	pr_datetime= '".G5_TIME_YMDHIS."' "; 
	sql_query($sql); 
	$pr_id=sql_insert_id();
	return $pr_id;  
}

//정답노트를 리셋한다.
function exam_level1_reset(){
	global $member; 
	$sql = "update exam_level1 set
	pr_cnt='0', 
	pr_prev='' , 
	pr_last = '".G5_TIME_YMDHIS."'
	where pr_id='{$pr_id}'"; 
	sql_query($sql); 
}


//현재 정답을 정의한다.
function exam_level1_pass_count($pr_id, $wr_id, $lo_cnt=0){
	global $g5 , $member;
	//ps_cnt : 연속 정답 , ps_total : 누적 정답수
	$sql="select count(*) as cnt 
	from exam_level1_log
	where mb_id='".$member['mb_id']."'
	AND pr_id='".$pr_id."'
	AND wr_id='".$wr_id."' ";
	$row=sql_fetch($sql); 
	
	if($row['cnt']){
		$sql="update exam_level1_log set 
		".(($lo_cnt)?"lo_true = lo_true+1 , ":" lo_false = lo_false+1 , ")."
		lo_datetime='".G5_TIME_YMDHIS."'
		where mb_id='".$member['mb_id']."'
		AND pr_id='".$pr_id."'
		AND wr_id='".$wr_id."' ";
		sql_query($sql);
	}
	else {
		$sql="insert exam_level1_log set 
		lo_id='', 
		mb_id='".$member['mb_id']."', 
		pr_id='".$pr_id."', 
		wr_id='".$wr_id."', 
		".(($lo_cnt)?"lo_true='1' ":"lo_false='1' ")." ,
		lo_datetime='".G5_TIME_YMDHIS."' ";
		sql_query($sql);
	}
}


?>