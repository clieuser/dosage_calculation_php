<?php
include_once(G5_PATH.'/head.php');

//======================
//진행사항을 불러온다
$pr=exam_level1_data($cate);
if(!$pr['pr_id']){
	$pr_id=exam_level1_create($cate);
}else{
	$pr_id=$pr['pr_id'];
}
//======================

//======================
//현재 진행률을 확인한다 
$examPer=0;
if($pr['pr_cnt']){
	$examPer=intval(($pr['pr_cnt']/LEVEL1_PASS_CNT) * 100);
}else{
	$examPer=0; 
}
//$examPer=66;

include_once "./level1_head.php";
?>
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
<!-- ************************
// 내용을 등록해 주세요 
************************-->
<div id="examCon" class="init" style="padding-top:0px;">
	<div class="current">
		<span class='icon icon-badge'></span>
		<?php if($member['mb_level1'] > 2){
			echo LEVEL1_NAME." 전과정을 통과하셨습니다."; 
		}else if($member['mb_level1'] > 1){
			echo LEVEL1_NAME." ".$g5['level1_level'][1]." 과정 완료."; 
		}else if($member['mb_level1'] > 0){
			echo LEVEL1_NAME." ".$g5['level1_level'][0]." 과정 완료"; 
		}else {
			echo LEVEL1_NAME." ".$g5['level1_level'][0]." 과정 진행중"; 
		}
		?>
	</div>

	<div class="level_head" id="examLevel">
		<?php if($member['mb_level1']==$cate){?>
		<div class="swProgress">
			<div class="ssTitle"><?php echo LEVEL1_NAME ;?> <?php echo $g5['level1_level'][$cate];?> 진행율 <?php echo $examPer;?>%</div>
			<div class="progress">
				<div class="progress-bar bg-warning" role="progressbar" style="width: <?php echo $examPer;?>%" aria-valuenow="<?php echo $examPer;?>" aria-valuemin="0" aria-valuemax="100"><?php echo $examPer;?>%</div>
			</div>
		</div>
		<?php }?>
		<div class="swCon">
			<div class="timerText">진행시간 </div> <div class="timer well"></div>
		</div>
	</div>	

	<!-- ####################
	시험문제를 정의
	#####################-->
	<form id="formLevel1" name="formLevel1" onsubmit="return level1Submit()">
	<input type="hidden" name="bo_table" value="level1">
	<input type="hidden" name="wType" value="level1_check">
	<input type="hidden" name="cate" id="cateNum" value="<?php echo $cate;?>">
	<input type="hidden" name="examRepeat" id="examRepeat" value="0">
	<div id="examQ" class="examDiv active">

	</div>
	</form>

	<!-- 시험결과를 정의 -->
	<div id="examR" class="examDiv">

	</div>

	<!-- ####################
	시험버튼을 정의한다
	#####################-->
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="/js/ez.countimer.js"></script>
<script src="/js/exam_level1.js"></script>




<!-- ************************
// END 내용을 등록해 주세요 
************************-->
