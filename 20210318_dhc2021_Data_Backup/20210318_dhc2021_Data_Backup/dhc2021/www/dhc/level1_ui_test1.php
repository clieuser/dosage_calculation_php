<?php
include_once('./_common.php');
if(!$member['mb_id']){
	alert(LEVEL1_NAME."은 회원만 접근가능합니다.\\n회원이시라면 로그인 후 이용해주세요.", G5_BBS_URL.'/login.php?'.$qstr.'&amp;url='.urlencode($_SERVER['SCRIPT_NAME']));
}
$pageTitle=LEVEL1_NAME;
include_once(G5_PATH.'/head.php');


$nav_id=0;
$nav_box=1;
include_once "./level1_head.php";

//초기 진행률을 계산
$examPer=65;
?>
<!-- ************************
// 내용을 등록해 주세요 
************************-->
<div id="examCon">
	<!-- 현재 상태를 정의한다 -->
	
	<div class="level_head">
		<div>
			<div class="ssTitle">초급 과정 진행율</div>
			<div class="pieCon">
				<div class="pie_progress" role="progressbar" data-goal="100" aria-valuemin="0" aria-valuemax="100">
				  <span class="pie_progress__number">0%</span>
				</div>
			</div>
		</div>
		
		<div class="swCon">
			<div class="ssTitle">트레이닝 진행시간</div>
			<div class="timer well"></div>
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
			<li id="examStart2"><button type="button" class="btn btn-lg btn-success" onclick="location.href='./level1_ui_test1_1.php'">트레이닝 시작하기</button></li>
			
			<li id="examRestart2"><button type="button" class="btn btn-lg btn-info">트레이닝 처음부터 시작하기</button></li>
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

</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="/js/ez.countimer.js"></script>
<script src="/js/exam_level0.js"></script>

<script type="text/javascript">
	var pie_per=<?php echo intval($examPer);?> ;
</script>

<!-- ************************
// END 내용을 등록해 주세요 
************************-->
<?php
include_once(G5_PATH.'/tail.php');
?>