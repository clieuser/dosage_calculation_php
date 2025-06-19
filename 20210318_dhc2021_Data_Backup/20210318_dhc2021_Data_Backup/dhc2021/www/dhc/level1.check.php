<?php
include_once G5_PATH."/dhc/level1.lib.check.php";

if(!$member['mb_id']){
	ajax_msg(array(0,"회원만 접근가능합니다.")); 
}

$wr_id=$question_wr_id;
if(!$wr_id){
	ajax_msg(array(0,"체크할 내용이 들어오지 않았습니다.")); 
}

if(!$pr_id){
	ajax_msg(array(0,"체크할 내용이 정확하지 않습니다. 다른 문제를 선택해주세요.")); 
}

$pr=exam_level1_data($cate, $pr_id); 
if(!$pr['pr_id']){
	ajax_msg(array(0,"체크할 내용이 정확하지 않습니다. 이전으로 가서 다시 시작해 주세요.")); 
}

//====================================
//문제를 찾는다 
$sql = "select *  
from g5_write_level1
where wr_id= '{$wr_id}'"; 
$write=sql_fetch($sql); 
if(!$write['wr_id']){
	ajax_msg(array(0,"체크할 내용이 정확하지 않습니다. 이전으로 가서 다시 시작해 주세요.")); 
}

//=====================================
//정답 확인 함수를 정의한다. 
//$check_answer
//$result_value=array();
//include_once G5_PATH."/dhc/level1.lib.check.php"; 정의

$row=level1Answer($write, $examVal); 
$answer=$row[0];
$replace=$row[1];
//=====================================

//=====================================
//정답,오답을 확인한다.
$result=array();
$is_ok=1; 
$counter = $write['wr_4']; //문항수를 정의

for($i=0;$i<$counter;$i++){
	if($exam_answer[$i]==$answer[$i]){
		$result[]=1;
		$answer_ok=1;
	}else{
		$is_ok=0;
		$answer_ok=0;	
		$result[]=0;
	}

	//==================================
	//정답 오답 내용을 저장한다.
	$sql = "select * from exam_level1_log 
	where pr_id='{$pr_id}'
	AND mb_id='{$member['mb_id']}'
	AND wr_id='{$wr_id}'
	AND as_id='{$i}'";
	$row=sql_fetch($sql);
	
	if($row['lo_id']){
		$sql = "update exam_level1_log set
		".(($answer_ok)?"lo_true=lo_true+1":"lo_false=lo_false+1")." ,
		lo_datetime= '".G5_TIME_YMDHIS."'
		where lo_id='{$row['lo_id']}'";
		sql_query($sql); 
	}else{
		$sql = "insert into exam_level1_log set
		pr_id='{$pr_id}', 
		mb_id='{$member['mb_id']}', 
		wr_id='{$wr_id}', 
		as_id='{$i}',
		".(($answer_ok)?"lo_true='1'":"lo_false='1'")." ,
		lo_datetime= '".G5_TIME_YMDHIS."'	";
		sql_query($sql); 
	}
	//==================================
}

//===================================
//진행상태를 확인한다. 진행완료 
$pr_end_sql=""; //과정마감 sql
$pr_end=0; //과정마감
$pr_complete=0; //전체마감
$pr_complete_sql= ""; 
/*
//
1. 재연습이 아니고 
2. 현재 상태가 현재진행중 트레이닝 과정과 동일하다면 상위하위면 연습 
*/
if(!$examRepeat && $member['mb_level1']==$cate)
{
	if($is_ok==1){//정답이면
		if($cate==$write['wr_1']){//동일레벨만 카운트 증가 정답레벨증가
			//카운트를 추가한다
			$pr['pr_cnt']++;			
			/* 과정이수이면 
			1. pr_end 를 정의하고 
			2. member me_level1 값을 추가하고 
			3. mb_level 값을 확인한다
			*/ 
			//과정이수 인가?
			if($pr['pr_cnt']>=LEVEL1_PASS_CNT){
				//이수완료 과정마감
				$pr_end=1; //과정마감
				$pr_end_sql= " pr_end='1' , "; //마감 sql 
				
				$member['mb_level1']++; //과정증가
				if($member['mb_level1'] >= LEVEL1_LEVEL){ 
					//level1 과정을 통과하였으면 
					$pr_complete=1;
					$pr_complete_sql= " mb_level = mb_level+1 , ";
				}
				$sql = "update {$g5['member_table']} set
				{$pr_complete_sql}
				mb_level1=mb_level1+1
				where mb_id='{$member['mb_id']}'";
				sql_query($sql); 				
			}
			$sql = "update exam_level1 set
			{$pr_end_sql}
			pr_cnt=pr_cnt + 1 ,
			pr_prev='{$write['wr_id']}', 
			pr_last='".G5_TIME_YMDHIS."'
			where pr_id='{$pr_id}'"; 
			sql_query($sql); 
			$sql2=$sql;
		}
	}
	else{
		//틀리면 리셋을 정의한다 
		$sql = "update exam_level1 set
			pr_cnt=0 ,	
			pr_prev='{$write['wr_id']}', 
			pr_last = '".G5_TIME_YMDHIS."'
			where pr_id='{$pr_id}'"; 
		sql_query($sql); 
		$pr['pr_cnt']=0;
	}
}


//===============================
//정답을 보여준다
$unitCon=rt_decode($write['wr_10']);
$correct = array();
foreach($answer as $key=>$value){
	$correct[]= "<span class='bold'>".($key+1).".</span> ".$value.$unitCon[$key];
}
$correct_str= implode(" , ", $correct);

//=======================================
//풀이과정을 보여준다 
$wr_8=nl2br($write['wr_8']); //결과시나리오를 수식으로 교체한다 
foreach($replace as $key=>$value){
	$wr_8=str_replace("{".$key."}", $value , $wr_8); 
}

$str = "<div id='level1Result'>
	<div class='result01 alert alert-primary my-2'>
		<div class='resultHead'>정답</div>
		<div class='resultText'>".$correct_str."</div>
	</div>
	<div class='result02 alert alert-success my-2'>
		<div class='resultHead'>계산기본공식</div>
		<div class='resultText'>".nl2br($write['wr_7'])."</div>
	</div>
	<div class='result03 alert alert-danger my-2'>
		<div class='resultHead'>풀이</div>
		<div class='resultText'>".$wr_8."</div>
	</div>
</div>"; 

//메세지와 버튼을 정의한다.
if($pr_complete==1){
	$str .="<div class='nextStep nextComplete'>
	축하드립니다.!! ".LEVEL1_NAME." 과정을 수료하셨습니다. 
</div>";	
	$per=100;
}else if($pr_end==1){
	$str .="<div class='nextStep nextEnd'>
	축하드립니다.!! ".LEVEL1_NAME." ".$g5['level1_level'][$cate]."과정을 수료하셨습니다.<br>
	다음단계로 넘어 가실수 있습니다. 
</div>";
	$per=100;
}
else {
	$str .="<ul class='level1Btn leve1Btn2'>
	<li><button type='button' class='btn btn-lg btn-info' onclick='level1_loading(1)'>동일문제풀기</button></li>
	<li><button type='button' class='btn btn-lg btn-primary' onclick='level1_loading(0)'>다른문제풀기</button></li>
	</ul>
</div>";
	$per=intval(($pr['pr_cnt'] / LEVEL1_PASS_CNT) * 100);
}
//체점 내용을 보낸다 
ajax_msg(array(1, $result, $str, $per, $is_end, $is_complete));


