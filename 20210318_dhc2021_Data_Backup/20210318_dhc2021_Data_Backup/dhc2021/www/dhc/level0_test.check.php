<?php
if(!$member['mb_id']){
	ajax_msg(array(0,LEVEL0_NAMES." 테스트는 회원만 접근가능합니다.")); 
}

if($member['mb_level'] < LEVEL1_LEVEL){
	if(!$member['mb_level0']){//트레이닝을 통과하지 못하였다면
		ajax_msg(array(0,LEVEL0_NAMES." 테스트는 ".LEVEL0_NAME."을 통과하셔야 가능합니다\\n.".LEVEL0_NAME." 통과후 테스트 해주세요")); 
	}
}

$counter=count($exam_wr_id);
if(!$counter){
	ajax_msg(array(0,"체크할 내용이 들어오지 않았습니다.")); 
}

//내용을 검색한다
$is_complete=1;
$result=array();
$counter=count($exam_wr_id);

for($i=0;$i<$counter;$i++){
	$temp_wr_id=$exam_wr_id[$i];  //문제 번호
	$temp_subject=$exam_subject[$i]; //질문
	$temp_answer=$exam_answer[$i]; //답변
	
	//정답을 정의 내용을 정의
	$sql = "select * from {$write_table}
	where wr_id='{$temp_wr_id}'";
	$row=sql_fetch($sql);
	if(!$row['wr_id']){
		$result[]=array(1);
		continue;
	}

	//답을 정의한다.
	$is_ok=0;
	
	if($row['wr_4']==1){
		$temp_result=$temp_subject / $row['wr_2'];
	}else{
		$temp_result=$temp_subject * $row['wr_2'];
	}	 
	$temp_result = round($temp_result, $row['wr_3']);

	if($row['wr_3'] > 0 ){ 
		//소수점을 정의
		if($temp_answer==$temp_result){
			$is_ok=1;
		}
	}else{
		if($temp_answer==$temp_result || $temp_answer==number_format($temp_result) ){
			$is_ok=1;
		}
	}

	if($is_ok){
		$result[]=1;
	}else{
		//에러 
		$is_complete=0;
		
		$wr_subject=explode(",", $row['wr_subject']);
		$wr_content=explode("|", $row['wr_content']);
		
		//<div class='hint'>HINT : {$wr_content[0]}은 {$wr_content[1]} 입니다.</div>
		$result_str.="<li>
		<div class='num'>".($i+1).". </div>
		<div class='resultCon'>
			<div class='result'>RESULT : {$temp_subject}{$wr_subject[0]} 은 {$temp_result}{$wr_subject[1]} 입니다.</div>
		</div>
		</li>";
		$result[]=0;
	}
}


if($is_complete){
	$addStr="";
	if($member['mb_level']<=LEVEL0_LEVEL){
		$sql = "update {$g5['member_table']} set
		mb_level='".LEVEL1_LEVEL."'
		where mb_id='{$member['mb_id']}'"; 
		sql_query($sql);
		$addStr="<br>".LEVEL1_NAME."을 하실수 있습니다.";
	}

	$testButton = "<li>축하합니다. !! <br>
			".LEVEL0_NAMES." 테스트를 통과하셨습니다.
			{$addStr}
		</li>
		<li class='mt-3'>
			<button type='button' class='btn btn-lg btn-info' onclick=\"location.href='./level1_basic.php'\">".LEVEL1_NAME." 시작하기</button>
		</li>";
	//현재 레벨이 낮으면 올립니다.	

}else{
	$testButton = "<li>
			<button type='button' class='btn btn-lg btn-primary level0_test_repeat_btn' onclick=\"location.href='./level0_test.php'\">테스트 다시 하기</button>
		</li>";
}

$rStr.="<div class='level0_test_next'>
	<ul>
	{$testButton}
	</ul>
</div>";

if($result_str){
	$rStr.="<div class='error_list alert alert-danger'>
		<div class='rsTitle'>오답노트</div>
		<ul>{$result_str}</ul>
	</div>";
}

//체점 내용을 보낸다 
ajax_msg(array(1,$result, $rStr , $is_complete ));