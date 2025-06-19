<?php
if(!$member['mb_id']){
	ajax_msg(array(0,"기초 트레이닝은 회원만 접근가능합니다.")); 
}
$pr_cnt=0;
$prow=array();

//시험문제 정리 현재 전체는 0으로
$prow=exam_level0_prow(); 

//마지막 저장내용을 확인한다
$pr=exam_level0_bakupdata();

$pr_id=$pr['pr_id'];

if($pr['pr_id']){ //내용이 있으면
	if($pr['pr_end']){ 
		//만약 마감된 내용이면 새로 생성
		$pr_id=exam_level0_create(); 
	}else{
		 if($is_start==1){
			//처음부터 시작이면 reset 
			exam_level0_reset($pr_id); 
		}
		else{
			//이어서 시작이면 $prow 를 정리한다
			$prow=exam_level0_prow($pr_id);
		}
	}
}else {
	//내용이 없으면 새로 등록한다
	$pr_id=exam_level0_create(); 
}

//검사할 내용을 정리한다
//출제할 문제를 초기화한다
$rand_array=array(); 
//남아있는 문제 번호를 가지고 온다
$wrong_row=exam_level0_prow_wrong($prow);
//남아있는 문제 수를 확인한다
$total_cnt=count($wrong_row); 
//랜덤변수를 확인한다.
$rand_limit=$total_cnt-1;

// LEVEL0_TRINING_CNT(출제 문제수와 남아있는 내용을 비교)
//만약 남아있는 문제가 출제문제수 보다 적다면
if($total_cnt <= LEVEL0_TRINING_CNT){
	$rand_array=$wrong_row;
	shuffle($rand_array);
}else{
	//===========================================
	/*
	남아있는 문항수가 LEVEL0_TRINING_HALF(랜덤제한) 
	보다 작거가 같다면
	이전문제에서 내용외에 문제를 등록한다
	*/
	if($total_cnt <= LEVEL0_TRINING_HALF){
		if($row['pr_prev']){
			//이전 내용을 제외한다
			$except_wr_id=explode(",", $row['pr_prev']);
			foreach($wrong_row as $temp_wr_id){
				if(!in_array($temp_wr_id, $except_wr_id)){
					$rand_array[]=$remp_wr_id;
				}
			}
			//추출내용을 재정렬한다
			$wrong_row=$except_wr_id;
		}
	}else {
		
		//2회차이면 이전 내용 제외
		if($pr['pr_cnt']==1 && $row['pr_prev'] ){
			$except_wr_id=explode(",", $row['pr_prev']);
			$new_wrong_row=array();
			foreach($wrong_row as $temp_wr_id){
				if(!in_array($temp_wr_id, $except_wr_id)){
					$new_wrong_row[]=$remp_wr_id;
				}
			}
			//추출내용을 변경한다. 
			$wrong_row=$new_wrong_row; 
		}
	}
	
	//===========================================
	$total_cnt=count($wrong_row);
	$rand_limit=$total_cnt-1;
	$k=count($rand_array);//현재등록된 내용을 정의한다
	
	for($i=0 ; ( $i < 1000) && ( $k < LEVEL0_TRINING_CNT) ; $i++){
		//랜덤수를 추출
		$rand=rand(0, $rand_limit);
		$temp_wr_id=$wrong_row[$rand];
		//등록내용이 있다면 
		if(in_array($temp_wr_id, $rand_array)){
			continue; 
		}
		
		$rand_array[]=$temp_wr_id; 
		$k++;
	}
}

$str= "<table class='exam_list'>
<tr class='head'>
	<td class='num'>No.</td>
	<td class='subject'>문제</td>
	<td class='arrow'></td>
	<td class='answer'>변환</td>
	</tr>"; 
$m=0; 
foreach($rand_array as $wr_id)
{
	$sql = "select *  
	from g5_write_level0
	where wr_id='{$wr_id}'";
	$row=sql_fetch($sql); 
	if(!$row['wr_id']){
		continue; 
	}
	$order=rand($row['wr_5'],$row['wr_6']);
	$subject=explode(",", $row['wr_subject']);
	$temp_result="";
	if($is_admin)
	{
		if($row['wr_4']==1){
			$temp_result=$order / $row['wr_2'];
		}else{
			$temp_result=$order * $row['wr_2'];
		}	 
		$temp_result = round($temp_result, $row['wr_3']);
	}
	$str.="<tr class='exam{$m} examTr ' >
		<td class='num'>".($m+1)."</td>
		<td class='subject'>{$order} <span class='unit'>{$subject[0]}</span></td>
		<td class='arrow'>=&gt;</td>
		<td class='answer'>
		<input type='hidden' name='exam_wr_id[{$m}]' value='{$wr_id}'>
		<input type='hidden' name='exam_subject[{$m}]' value='{$order}'>
		<input type='text' name='exam_answer[{$m}]' id='exam_answer{$m}' value='{$temp_result}' class='exam_answer required ' required maxlength='15' >
		<span class='unit resultUnit '>{$subject[1]}</span>
		</td>

	</tr>"; 
	$m++;
}
$str.="</table>
<div class='text-right text-danger'>소수점은 4자리에서 반올림해주세요</div>
<div class='text-center my-3 examSubmitBox'>
<input type='hidden' name='pr_id' value='{$pr_id}'>
<button type='submit' class='btn btn-lg btn-primary examSubmit'>입력완료</button>
</div>
";
ajax_msg(array(1,$str));