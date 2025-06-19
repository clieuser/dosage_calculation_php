<?php
include_once('./_common.php');
$pageTitle=LEVEL0_NAMES." 테스트";

include_once "./_member_check.php"; 

/*******************************************
단위환산 트레이닝, 테스트를 마친 회원만 테스트가 가능하다
*******************************************/
if($member['mb_level'] < LEVEL1_LEVEL){
	if(!$member['mb_level0']){//트레이닝을 통과하지 못하였다면
		alert(LEVEL0_NAMES." 테스트는 ".LEVEL0_NAME."을 통과하셔야 가능합니다\\n.".LEVEL0_NAME." 통과후 테스트 해주세요", "./level0.php");
	}
}
//===========================================
include_once(G5_PATH.'/head.php');

$nav_id=2;
include_once "./level0_head.php";

/*
# 시험문제를 출제한다 
- 출제가능한 시험문제를 확인한다
- 최신 완료된 트레이닝을 확인한다
- 가장 마지막에 마친문제부터 10개를 추출한다
- 10개가 안되면 남아 있는 문제에서 임의로 내용을 추출한다. 
- 시험을 노출한다 -> 시간을 시작한다
- 완료후 시험을 채점한다 
- 만점이면 약물용량계산으로 넘어간다 
- 만점이 아니면 다시보기나 트레이닝 연습하기 버튼을 만든다
2. 10개가 안되면 전체에서 
*/
$rand_array=array();
//1. 전체 문제를 확인한다.
$prow = exam_level0_wr_id();

//최신 완료된 내용을 확인한다.
$sql = "select * from exam_level0
where mb_id='".$member['mb_id']."'	
pr_end = '1' 
order by pr_id desc 
limit 1";
$row= sql_fetch($sql);
if($row['pr_id']){
	$pr_id=$row['pr_id'];
	//패스된 내용을 확인한다.  
	$sql="select wr_id 
	from exam_level0_pass
	where mb_id='".$member['mb_id']."'
	AND pr_id='".$pr_id."'
	order by ps_datetime desc ";
	$result=sql_query($sql); 
	while($row=sql_fetch_array($result)){
		if(isset($prow[$row['wr_id']])){
			$rand_array[]=$row['wr_id']; 
		}
		if(count($rand_array)==LEVEL0_TEST_CNT){
			break;
		}
	}		
}
//시험내용이 찾는지 확인 안찾으면 내용을 추가한다.
if(count($rand_array)<LEVEL0_TEST_CNT){
	shuffle($prow); 
	foreach($prow as $temp_wr_id){
		//이미 있는지 확인
		if(in_array($temp_wr_id, $rand_array)){
			continue; 
		}
		$rand_array[]=$temp_wr_id;
		//만약 시험문제가 찾다면 
		if(count($rand_array)>=LEVEL0_TEST_CNT){
			break;
		}
	}
}
shuffle($rand_array);

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


	$subject=explode(",", $row['wr_subject']);
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
?>
<!-- ************************
// 내용을 등록해 주세요 
************************-->
<div id="examCon" class="start">
	<!-- 현재 상태를 정의한다 -->
	<?php if($member['mb_id'] < LEVEL1_LEVEL){?>
	<div id="examC" class="examDiv active">
		<?php echo LEVEL0_NAMES;?>테스트입니다.<br> 
		테스트 만점을 받아야 통과하실수 있습니다. <br>
		테스트를 통과하시면 <?php echo LEVEL1_NAME;?>으로<br>넘어가실 수 있습니다.
		힘내세요 파이팅!!
	</div>
	<?php }?>
	
	<div class="level_head" id="examLevel">
		<div class="swCon">
			<div class="timerText">진행시간 </div> <div class="timer well autoStart"></div>
		</div>
	</div>	


	<!-- ####################
	시험문제를 정의
	#####################-->
	<form id="formLevel0" name="formLevel0" onsubmit="return level0TestSubmit()">
	<input type="hidden" name="bo_table" value="level0">
	<input type="hidden" name="wType" value="level0_test">
	<div id="examQ" class="examDiv active">
		<table class='exam_list'>
		<tr class='head'>
			<td class='num'>No.</td>
			<td class='subject'>문제</td>
			<td class='arrow'></td>
			<td class='answer'>변환</td>
		</tr>
		<?php echo $str;?>
		</table>
	</div><!-- examQ -->
	

	<!-- 시험결과를 정의 -->
	<div id="examR" class="examDiv active">
		<div class='text-center my-3 examSubmitBox'>
			<button type='submit' class='btn btn-lg btn-primary level0TestSubmit'>입력완료</button>
		</div>	
	</div>

	</form>
</div>
<!-- ************************
// END 내용을 등록해 주세요 
************************-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="/js/ez.countimer.js"></script>
<script src="/js/exam_level0.js"></script>


<?php
include_once(G5_PATH.'/tail.php');
?>