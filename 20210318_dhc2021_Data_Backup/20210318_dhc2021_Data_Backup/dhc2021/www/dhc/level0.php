<?php
include_once('./_common.php');
include_once "./_member_check.php"; 

$pageTitle=LEVEL0_NAME;
include_once(G5_PATH.'/head.php');

$nav_id=1;
include_once "./level0_head.php";

$prow=exam_level0_prow(); 


//시험문제수
$examCnt=exam_cnt("level0");

//저장내용을 불러온다
$pr=$row=exam_level0_bakupdata();

//초기 진행률을 계산
$examPer=0;
if($pr['pr_id']){
	if($pr['pr_end']){
		$examPer=100;
	}else{
		$counter = exam_level0_pass_cnt($pr['pr_id']); 
		if($counter){
			//진행률을 정의한다.
			$examPer=intval( ($counter / $examCnt) * 100 ); 
		}
	}
}

//$examPer=65;
?>
<!-- ************************
// 내용을 등록해 주세요 
************************-->
<div id="examCon" class="init">
	<!-- 현재 상태를 정의한다 -->
	<div id="examC" class="examDiv active">
		<?php if($member['mb_level']>LEVEL0_LEVEL){
			echo LEVEL1_NAME."및 테스트 과정완료."; 
		}else if($member['mb_level0']==1){
			echo LEVEL0_NAMES." 과정완료<br>
			".LEVEL0_NAMES." 테스트를 통과하시면 <br>
			".LEVEL1_NAME."으로 넘어가실수 있습니다."; 
		}else{
			echo LEVEL0_NAME." 진행중입니다"; 
		}
		?>
	</div>

	<div class="level_head" id="examLevel">
		<div class="swProgress">
			<div class="ssTitle"><?php echo LEVEL0_NAME ;?> 진행율</div>
			<div class="progress">
				<div class="progress-bar bg-warning" role="progressbar" style="width: <?php echo $examPer;?>%" aria-valuenow="<?php echo $examPer;?>" aria-valuemin="0" aria-valuemax="100"><?php echo $examPer;?>%</div>
			</div>
		</div>		
		<div class="swCon">
			<div class="timerText">진행시간 </div> <div class="timer well"></div>
		</div>
	</div>	



	<!-- ####################
	시험문제를 정의
	#####################-->
	<form id="formLevel0" name="formLevel0" onsubmit="return level0Submit()">
	<input type="hidden" name="bo_table" value="level0">
	<input type="hidden" name="wType" value="level0_check">
	<div id="examQ" class="examDiv active">

	</div>
	</form>


	<!-- 시험결과를 정의 -->
	<div id="examR" class="examDiv">
		
	</div>

	<!-- ####################
	시험버튼을 정의한다
	#####################-->
	<div id="examB" class="examDiv examBtn active">
		<ul>
			<li id="examStart"><button type="button" class="btn btn-lg btn-success">트레이닝 시작하기</button></li>
			
			<li id="examRestart"><button type="button" class="btn btn-lg btn-info">트레이닝 처음부터 시작하기</button></li>
		</ul>
	</div>

	<?php
		//mb_level 2, 3: mb_level0 pass 
		//mb_level0 :1 트레이닝 패스
		$examTDisabled=$examTActive="";
		//$member['mb_level']=LEVEL1_LEVEL;
		if($member['mb_level']>LEVEL0_LEVEL || $member['mb_level0']==1){
			//트레이닝 패스
			$examTActive="active";
		}else{
			$examTDisabled=" disabled";	
		}		
	?>
	<div id="examT" class="examDiv  examBtn <?php echo $examTActive;?>">
		<ul>
			<li id="examTest"><button type="button" class="btn btn-lg btn-primary <?php echo $examTDisabled;?>" <?php echo $examTDisabled;?> onclick="location.href='./level0_test.php'"><?php echo LEVEL0_NAME ;?> 테스트</button></li>
		</ul>
	</div>

</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="/js/ez.countimer.js"></script>
<script src="/js/exam_level0.js"></script>

<!-- ************************
// END 내용을 등록해 주세요 
************************-->
<?php
include_once(G5_PATH.'/tail.php');
?>