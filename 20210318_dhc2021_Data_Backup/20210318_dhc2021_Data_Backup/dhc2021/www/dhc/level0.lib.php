<?php
// 이 파일은 새로운 파일 생성시 반드시 포함되어야 함
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가
/****************************
level0
****************************/
//백업자료를 확인한다

//문제수를 정의한다. 
function exam_cnt($bo_table , $sub=""){
	global $g5; 
	$write_table = $g5['write_prefix'].$bo_table;
	$sql = "select count(*) as cnt 
	from {$write_table}
	where ca_name='사용'";
	$row=sql_fetch($sql); 
	return $row['cnt'];
}

function exam_list($bo_table , $sub=""){
	global $g5, $member; 
	$list_array=array();
	$write_table = $g5['write_prefix'].$bo_table;
	$sql = "select * 
	from {$write_table}
	where ca_name='사용'";
	$row=sql_fetch($sql); 
	while($row=sql_fetch_array($result)){
		$list[]=$row;
	}
	return $list;
}

function exam_level0_wr_id(){
	$sql = "select wr_id  
	from g5_write_level0
	where ca_name='사용'";
	$result=sql_query($sql); 
	while($row=sql_fetch_array($result)){
		$prow[]=$row['wr_id'];
	}
	return $prow; 
}
//level 0 시험 문제를 가지고 온다: 초기화
function exam_level0_prow($pr_id=0){
	global $g5 , $member; 
	$prow=array();
	$sql = "select wr_id  
	from g5_write_level0
	where ca_name='사용'";
	$result=sql_query($sql); 
	while($row=sql_fetch_array($result)){
		$prow[$row['wr_id']]=0;
	}

	if($pr_id){
		$sql="select wr_id, ps_cnt 
		from exam_level0_pass
		where mb_id='".$member['mb_id']."'
		AND pr_id='".$pr_id."'
		AND ps_cnt > 0 ";
		$result=sql_query($sql); 
		while($row=sql_fetch_array($result)){
			if(isset($prow[$row['wr_id']])){
				$prow[$row['wr_id']]=$row['ps_cnt'];//카운트를 정의해 놓는다
			}
		}
	}
	return $prow; 
}

//출제 문제를 정의한다 
function exam_level0_prow_wrong($prow){
	$wrong_prow=array();
	foreach($prow as $key => $value){
		if($value<2){
			$wrong_prow[]=$key; 
		}
	}
	return $wrong_prow; 
}

//level0 backup data 를 구한다
function exam_level0_bakupdata($pr_id=0){
	global $member; 
	$sql = "select * from exam_level0
	where mb_id='".$member['mb_id']."'	
	".(($pr_id)?" AND pr_id='{$pr_id}'":" order by pr_id desc  ") ;
	$row= sql_fetch($sql);
	return $row;
}

//level0 시험 통과 수량
function exam_level0_pass_cnt($pr_id){
	global $member; 
	$sql = "select count(*) as cnt 
	from exam_level0_pass
	where mb_id='".$member['mb_id']."'
	AND pr_id='".$pr_id."'
	AND ps_cnt = '2' " ;
	$row=sql_fetch($sql); 
	return $row['cnt'];
}

//level0 시험 통과 내용
function exam_level0_pass($pr_id){
	global $member; 
	$list=array();
	$sql = "select * 
	from exam_level0_pass
	where mb_id='".$member['mb_id']."'
	AND pr_id='".$pr_id."'
	order by ps_id " ;
	$result=sql_query($sql); 
	while($row=sql_fetch_array($result)){
		$list[]=$row;
	}
	return $list;
}

//테스트를 등록한다.
function exam_level0_create(){
	global $member; 
	$sql = "insert into exam_level0 set
	pr_id  = '' , 
	mb_id= '".$member['mb_id']."' ,
	pr_last = '".G5_TIME_YMDHIS."', 
	pr_datetime= '".G5_TIME_YMDHIS."' "; 
	sql_query($sql); 
	$pr_id = sql_insert_id();
	return $pr_id;  
}

//정답노트를 리셋한다.
function exam_level0_reset($pr_id){
	global $member; 
	$sql = "update exam_level0 set
	pr_cnt='0', 
	pr_prev='' , 
	pr_last = '".G5_TIME_YMDHIS."'
	where pr_id='{$pr_id}'"; 
	sql_query($sql); 
	
	$sql= "delete from exam_level0_pass
	where mb_id='".$member['mb_id']."'
	AND pr_id='".$pr_id."'"; 
	sql_query($sql); 
}


//현재 정답을 정의한다.
function exam_level0_pass_count($pr_id, $wr_id, $ps_cnt=0){
	global $g5 , $member;
	//ps_cnt : 연속 정답 , ps_total : 누적 정답수
	$sql="select count(*) as cnt 
	from exam_level0_pass
	where mb_id='".$member['mb_id']."'
	AND pr_id='".$pr_id."'
	AND wr_id='".$wr_id."' ";
	$row=sql_fetch($sql); 
	
	if($row['cnt']){
		$sql="update exam_level0_pass set 
		ps_cnt='".$ps_cnt."', 
		".(($ps_cnt)?"ps_total = ps_total+1 , ":" er_total = er_total+1 , ")."
		ps_datetime='".G5_TIME_YMDHIS."'
		where mb_id='".$member['mb_id']."'
		AND pr_id='".$pr_id."'
		AND wr_id='".$wr_id."' ";
		sql_query($sql);
	}
	else {
		$sql="insert exam_level0_pass set 
		ps_id='', 
		mb_id='".$member['mb_id']."', 
		pr_id='".$pr_id."', 
		wr_id='".$wr_id."', 
		ps_cnt='".$ps_cnt."',  
		".(($ps_cnt)?"ps_total":"er_total")." = '1',
		ps_datetime='".G5_TIME_YMDHIS."' ";
		sql_query($sql);
	}
}


//오답 노트를 정의
function exam_level0_wrong($pr_id, $wr_id, $er_content ){
	global $g5 , $member;
	$sql = "select * 
	from exam_level0_log
	where mb_id='".$member['mb_id']."'
	AND pr_id='".$pr_id."'  
	AND wr_id='".$wr_id."'"; 
	$row=sql_fetch($sql); 

	if($row['er_id']){
		//내용을 정의한다.
		if($row['er_content']){
			$er_content=$row['er_content'].";".$er_content;
		}
		$sql = "update exam_level0_log set
		er_cnt=er_cnt+1 ,
		er_content='{$er_content}'
		where er_id='{$row['er_id']}'"; 
		sql_query($sql); 
	}else{
		$sql = "insert into exam_level0_log set
		er_id='', 
		mb_id='".$member['mb_id']."', 
		pr_id='".$pr_id."'  ,
		wr_id='".$wr_id."',
		er_cnt='1', 
		er_content='{$er_content}' "; 
		sql_query($sql);
	}

}
?>