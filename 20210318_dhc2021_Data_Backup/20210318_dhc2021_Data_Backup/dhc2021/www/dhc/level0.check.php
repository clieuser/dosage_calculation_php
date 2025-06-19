<?php
if(!$member['mb_id']){
	ajax_msg(array(0,"기초 트레이닝은 회원만 접근가능합니다.")); 
}

$counter=count($exam_wr_id);
if(!$counter){
	ajax_msg(array(0,"체크할 내용이 들어오지 않았습니다.")); 
}

if(!$pr_id){
	ajax_msg(array(0,"체크할 내용이 정확하지 않습니다. 다른 문제를 선택해주세요.")); 
}

$pr=exam_level0_bakupdata($pr_id); 
if(!$pr['pr_id']){
	ajax_msg(array(0,"체크할 내용이 정확하지 않습니다. 이전으로 가서 다시 시작해 주세요.")); 
}

//현재 시험 문제를 정리한다 
$prow=exam_level0_prow($pr_id); 

//내용을 검색한다
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
		$wr_subject=explode(",", $row['wr_subject']);
		$wr_content=explode("|", $row['wr_content']);
		
		$result_str.="<li>
		<div class='num'>".($i+1).". </div>
		<div class='resultCon'>
			<div class='result'>해설 : {$temp_subject}{$wr_subject[0]} 은 <span class='text-underline'>{$temp_answer}</span>이(가) 아닌 {$temp_result}{$wr_subject[1]} 입니다.</div>
			<div class='hint'>기초정보 : {$wr_content[0]}은 {$wr_content[1]} 입니다.</div>
		</div>
		</li>";
		$result[]=0;
	}

	//================================
	//문제가 있다면 정리한다 
	$is_ok=1;
	//================================
	//================================
	//================================
	//================================
	
	if(isset( $prow[$temp_wr_id]) )
	{
		if($prow[$temp_wr_id]>1){
			; //패스
		}else{
			if($is_ok){
				$prow[$temp_wr_id]++;
				//채점정리 2시 자동 완료 처리
				exam_level0_pass_count($pr_id, $temp_wr_id, $prow[$temp_wr_id]);
			}
			else{
				$prow[$temp_wr_id]=0;
				exam_level0_pass_count($pr_id, $temp_wr_id, 0);//채점을 정리
				//오답 노트에 정의한다
				exam_level0_wrong($pr_id, $temp_wr_id, "{$temp_wr_id}|{$temp_subject}|{$temp_answer}|{$temp_result }" ) ; 
			}
		}
	}
}


if(true || $is_end){
	$testButton = "<li>
			<button type='button' class='btn btn-lg btn-primary' onclick='goto_level0_test()'>테스트 하기</button>
		</li>";
}
$rStr.="<div class='nextStep'>
	<ul>
		<li>
			<button type='button' class='btn btn-lg btn-success' onclick='level0_loading(0)'>트레이닝 계속</button>
		</li>
	{$testButton}
	</ul>
</div>";
if($result_str){
	$rStr.="<div class='error_list alert alert-danger'>
		<div class='rsTitle'>오답노트</div>
		<ul>{$result_str}</ul>
	</div>";
}



//==========================
//시험 만료를 확인한다.
$pass_count=0;
$total_count=count($prow);
foreach($prow as $value){
	if($value>1){
		$pass_count++;
	}
}

$pr_end_sql="";
$is_end=$per=0;
if($total_count == $pass_count){
	$per=100;
	$is_end=1; 
	$pr_end_sql =" pr_end = '1' , ";
	if($member['mb_level']<=LEVEL0_LEVEL){
		$sql = "update {$g5['member_table']} set
		mb_level0=1
		where mb_id='{$member['mb_id']}'"; 
		sql_query($sql); 
	}
}else{
	//시험문제수
	$examCnt=exam_cnt("level0");
	//저장내용을 불러온다
	$counter=exam_level0_pass_cnt($pr_id);
	$per=intval( ($counter / $examCnt ) * 100); 
}

//==========================
//등록내용을 정의한다.
$sql = "update exam_level0 set
{$pr_end_sql}
pr_cnt=pr_cnt+1 , 
pr_prev='".implode("," , $exam_wr_id)."' , 
pr_last = '".G5_TIME_YMDHIS."'
where pr_id='{$pr_id}'"; 
sql_query($sql); 


//체점 내용을 보낸다 
ajax_msg(array(1,$result, $rStr ,$per, $is_end ));