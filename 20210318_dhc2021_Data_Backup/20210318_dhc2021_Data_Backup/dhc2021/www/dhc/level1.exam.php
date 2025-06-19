<?php
include_once G5_PATH."/dhc/level1.lib.check.php";
if(!$member['mb_id']){
	ajax_msg(array(0,"회원만 접근가능합니다.")); 
}

//================================
//prow 정의
$cate=intval($cate);
$pr=exam_level1_data($cate);
if($pr['pr_id']){
	$pr_id=$pr['pr_id'];
}
else{
	$pr_id=exam_level1_create($cate);
	$pr=exam_level1_data($cate, $pr_id);
}
//================================

//출제할 시나리오를 가지고 온다
$temp_wr_id=0; 
if($examRepeat==1 && $pr['pr_prev']){
	//동일문제이면 ===> 문제가 있다면 
	if(in_array($pr['pr_prev'], $pr)){
		$temp_wr_id=$pr['pr_prev'];
	}
}

//==================================
//동일문제 제출이 아님
if(!$temp_wr_id)
{
	$examRepeat=0;
	//해당 등급 내용 추출 <= $cate 
	$prow=exam_level1_wr_id($cate);
	$rand_limit=count($prow)-1;
	
	//랜덤하게 문제를 확인한다.
	for($i=0;$i<1000;$i++)
	{
		$rand=rand(0,$rand_limit);
		$temp_wr_id=$prow[$rand]; 
		if($pr['pr_prev']==$temp_wr_id){
			$temp_wr_id=0;
			continue;
		}
		if($temp_wr_id){
			break; //문제 생성
		}
	}
}

if(!$temp_wr_id){
	ajax_msg(array(0,"문제생성을 못하였습니다. 다시 시도해주세요"));
}

//=================================
//문제를 정의한다
if($is_admin){
	$temp_wr_id=20; 
}
//=================================
//문제를 불러온다
$sql = "select *  
from g5_write_level1
where wr_id='{$temp_wr_id}'";
$write=sql_fetch($sql); 

//변수를 가지고온다 
$question=array();
$varCon=rt_decode($write['wr_5']);
$counter=count($varCon);
$wr_content=$write['wr_content'];
$hiddenStr="<input type='hidden' name='question_wr_id' value='{$write['wr_id']}'>
<input type='hidden' name='pr_id' value='{$pr_id}'>
<input type='hidden' name='cate' value='{$cate}'>";
foreach($varCon as $row){
	/*
	$g5['level1_var_type']=array("고정", "분리", "범위", "나이", "약물");
	$g5['level1_var_mode']=array("환경", "계산");
	*/
	$changStr="";
	$change_start="<span class='hint".($row['mode']+1)."'>"; 
	if($row['type']==0){//고정을 정의한다 
		$changeStr=$row['name'];
	}else if($row['type']==1){//분리를 정의한다. 
		$ex_name=explode("|", $row['name']);
		$rand_limit=count($ex_name)-1;
		$rand=rand(0,$rand_limit);
		$changeStr=$ex_name[$rand];
	
		//==============================
		//나이 특수를 정의한다 
		if($is_sex_age && $row['min']){
			//0:남아, 1:여아
			$ag_age=$is_sex_age;
			if($is_sex_age>=80){$ag_age=80;}
			else if($is_sex_age>=30){$ag_age=intval( $is_sex_age/10)*10 ;}
			else if($is_sex_age>=19){$ag_age=19;}
			else if($is_sex_age<3){$ag_age=3;}
			
			$ag_sex=(strpos($changeStr, "남")!==false)?0:1;
			
			$sql = "select * from exam_level1_age
			where ag_sex='{$ag_sex}'
			AND ag_age='{$ag_age}'";
			$arow=sql_fetch($sql); 
			$col_weight="ag_w".strtolower($row['min']);
			$temp_weight=$arow[$col_weight];
			$temp_height=$arow['ag_ha'];
			
			//키 나이를 확인한다.
			$wr_content=str_replace("{1W}", $temp_weight, $wr_content);
			$wr_content=str_replace("{1H}", $temp_height, $wr_content);
			$question['1W']=$temp_weight;
			$question['1H']=$temp_height;
			$hiddenStr.="<input type='hidden' name='examVal[1W]' value='{$temp_weight}'>";
			$hiddenStr.="<input type='hidden' name='examVal[1H]' value='{$temp_height}'>";
			$is_sex_age=0;
		}
		//키몸무게를 확인한다.
		//==================================
	}
	else if($row['type']==2){//범위를 정의한다. 
		$changeStr=rand($row['min'],$row['max']);
		if($row['term']){
			$changeStr*=$row['term'];
		}

		
	}
	else if($row['type']==3){//나이를 정의한다. 
		$changeStr=rand($row['min'],$row['max']);
		if($row['term']){
			$changeStr*=$row['term'];
		}
		if($row['unit']){
			$is_sex_age=$changeStr ; 
		}
	}
	else if($row['type']==4){//약물을 정의한다. 
		$ex_name=explode(";",$row['name']);
		$ex_name0=explode("|", $ex_name[0]);
		$rand_limit=count($ex_name0)-1;
		$rand=rand(0,$rand_limit);
		$changeStr=$ex_name0[$rand];
		if($row['max']==4){
			$ex_name3=explode("|", $ex_name[3]); 
			$value=$ex_name3[$rand];
			$wr_content=str_replace("{".$row['num']."C}", $value, $wr_content);
			$hiddenStr.="<input type='hidden' name='examVal[{$row['num']}C]' value='{$value}'>";
			$question[$row['num']."C"]=$value;
		}
		if($row['max']>=3){
			$ex_name2=explode("|", $ex_name[2]); 
			$value=$ex_name2[$rand];
			$wr_content=str_replace("{".$row['num']."B}", $value, $wr_content);
			$hiddenStr.="<input type='hidden' name='examVal[{$row['num']}B]' value='{$value}'>";
			$question[$row['num']."B"]=$value;
		}
		if($row['max']>=2){
			$ex_name1=explode("|", $ex_name[1]); 
			$value=$ex_name1[$rand];
			$wr_content=str_replace("{".$row['num']."A}", $value, $wr_content);
			$hiddenStr.="<input type='hidden' name='examVal[{$row['num']}A]' value='{$value}'>";
			$question[$row['num']."A"]=$value;
		}
	}
	$question[$row['num']]=$changeStr;
	$wr_content=str_replace("{".$row['num']."}", $change_start.$changeStr."</span>", $wr_content);
	$hiddenStr.="<input type='hidden' name='examVal[{$row['num']}]' value='{$changeStr}'>";
	$old_row=$row;
}

//============================
//예외를 정의한다 
if($write['wr_id']==18)
{
	foreach($varCon as $index => $row){
		if($row['num']==9){
			$startRow=$row;
		}else if($row['num']==10){
			$endRow=$row;
		}
	}
	//시작시간을 랜덤하게
	$endStr=$startStr="";
	$startTime=rand($startRow['min'], $startRow['max']-1);
	if($startTime>12){
		$startStr = ($startTime-12)." PM"; 	
	}else{
		$startStr = $startTime." AM";
	}
	$term=rand($endRow['min'], $endRow['max']-1);
	$endTime=$startTime+$term;
	if($endTime > 24){
		$endStr="다음날 ";
		$endTime -=24;
	}
	if($endTime>12){
		$endStr .= ($endTime-12)." PM"; 	
	}else{
		$endStr .= $endTime." AM";
	}
	$wr_content=str_replace("{9A}", $startStr, $wr_content);
	$wr_content=str_replace("{9B}", $endStr, $wr_content);
	$hiddenStr.="<input type='hidden' name='examVal[9A]' value='{$startTime}'>
	<input type='hidden' name='examVal[9B]' value='{$endTime}'>
	<input type='hidden' name='examVal[9C]' value='{$startStr}'>
	<input type='hidden' name='examVal[9D]' value='{$endStr}'>
	";
	$question['9A']=$startTime;
	$question['9B']=$endTime;
	$question['9C']=$startStr;
	$question['9D']=$endStr;
}

$answerCon=rt_decode($write['wr_6']);
$unitCon=rt_decode($write['wr_10']);

$answer=array();
if($is_admin){
	$result= level1Answer($write, $question); 
	$answer=$result[0];
}

foreach($answerCon as $index => $value)
{
	$wr_question .= "<div class='exam exam{$index} examTr'>
		<div class='ex1_item'> ".($index+1).". {$value}</div>
		<div class='ex1_answer'>
			<span class='ex1_text'>답변</span>"; 
	if($write['wr_id']==19 && $index==1){
		$wr_question.="
		<input type='text' name='exam_answer[{$index}]' id='exam_answer{$index}' value='".$answer[$index]."' class='exam_answer required ' required maxlength='3' style='width:60px;'>
		<span class='unit resultUnit'>".$unitCon[$index]."</span> 
		<input type='text' name='exam_answer[".($index+1)."]' id='exam_answer{".($index+1)."}' value='".$answer[$index+1]."' class='exam_answer required ' required maxlength='3' style='width:60px;margin-left:5px;'>
		<span class='unit resultUnit '>분</span>"; 
	}else{
	$wr_question.="
		<input type='text' name='exam_answer[{$index}]' id='exam_answer{$index}' value='".$answer[$index]."' class='exam_answer required ' required maxlength='15' >
			<span class='unit resultUnit '>".$unitCon[$index]."</span>"; 
	}
	$wr_question.="
		</div>
	</div>"; 
}
$wr_question .="<div id='hintDetail' class='alert alert-danger'>".nl2br($write['wr_7'])."</div>
<ul class='level1Submit level1Btn leve1Btn2' style='margin-bottom:0px;'>
<li><button type='button' class='btn btn-lg btn-info mr-2' onclick='hint_view1()'>힌트보기</button></li>
<li>
	<button type='submit' class='btn btn-lg btn-primary examSubmit'>입력완료</button>
</li>
</ul>"; 

$ch_source=array("{sh1}", "{sh2}","{sh3}","{/sh}"); 
$ch_change=array("<span class='hint1'>", "<span class='hint2'>","<span class='hint3'>", "</span>");
$wr_content=str_replace($ch_source,$ch_change, $wr_content); 
$wr_question=str_replace($ch_source,$ch_change,$wr_question); 



$noticeStr="";
if($write['wr_9']){
	$noticeStr="<div class='ex1Notice'>{$write['wr_9']}</div>";
}

//==================================


//답을 확인한다
//====================================
$str = "{$hiddenStr}
<div class='ex1Box'>
	<div class='ex1Title'>Q</div>	
	<div class='ex1Head'>
		<div><span class='head'>난이도</span> ".$g5['level1_star'][$write['wr_1']]."</div>
		<div><span class='head'>병명</span> ".$write['wr_subject']."</div>
	</div>
	<div class='ex1Body'>".nl2br($wr_content)."</div>
	<div class='ex1Q'>{$wr_question}</div>
	{$noticeStr}
</div>
{$submitStr} ";

//echo $str;
ajax_msg(array(1,$str));