<?php
include_once('./_common.php');
if(!$member['mb_id']){
	alert(LEVEL1_NAME."은 회원만 접근가능합니다.\\n회원이시라면 로그인 후 이용해주세요.", G5_BBS_URL.'/login.php?'.$qstr.'&amp;url='.urlencode($_SERVER['SCRIPT_NAME']));
}
$pageTitle=LEVEL1_NAME;
include_once(G5_PATH.'/head.php');


$nav_id=1;
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
			<div class="ssTitle">중급 과정 진행율</div>
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

		
		<div class="level1_exam " >
				<span class='hint1'>50</span>대 <span class='hint1'>남자</span> 환자가 갑자기 <span class='hint1'>심장이 크게 두근거리고</span>, <span class='hint1'>어지러운</span> 증상이 있고 차고 있던 스마트워치에 심실상 부정맥 주의경고가 뜨는 것을 보고 내원하였다. 심전도 검사 결과 <span class='hint1'>심방세동</span>으로 진단되어 담당의사는 <span class='hint2'>2% Lidocaine</span>을 <span class='hint2'>100mg/2min</span>을 처방하였다.

		6-1 <span class='hint2'>2% Lidocaine</span>은 mL당 <span class='hint1'>몇 mg</span>의 <span class='hint1'>Lidocaine</span>이 들어 있는가?
		6-2 의사 처방에 따르면 <span class='hint2'>2% Lidocaine</span>을 <span class='hint2'>분당 몇 ml</span>로 주입해야 하는가?
		6-3 의사 처방에 따르면 <span class='hint2'>2% Lidocaine</span> 을 <span class='hint2'>몇 gtt/min</span> 으로 주입해야 하는가?

		</div>
		
		<style>
			.level1_submit2{display:block;}
			.level1_submit2 > div{display:flex;align-items:center;justify-content:center;}
			.level1_submit2 > div span{display:inline-block;}
			.level1_submit2 > div span.num{width:50px;}

		</style>
		<div class="level1_submit level1_submit2">
			<div class="mb-2">
				<span class="num">1. </span> 
				<input type="text" name="" value="2100" readonly disabled>
				<span class="unit">mg</span>
			</div>
			<div class="mb-2">
				<span class="num">2. </span> <input type="text" name="" value="200" readonly disabled>
				<span class="unit">ml</span>
			</div>
			<div class="mb-4">
				<span class="num">3. </span>
				<input type="text" name="" value="3400" readonly disabled>
				<span class="unit">gtt/min</span>
			</div>
			<div style="width:100%;">
			<button type="button" class="btn btn-lg btn-primary" onclick="location.href='level1_ui_test1_5.php'" style="width:100%;">답변 제출</button>		
			</div>
		

			<div class="level1_hint">
				<button type="button" class="btn btn-lg btn-info mr-2" onclick="hint_view1()">힌트 보기</button>
			</div>
		</div>
	</div>
	</form>

	<script>
		function hint_view1(){
			jQuery("#examQ").addClass("hint1");
		}
		function hint_view2(){
			jQuery("#examQ").addClass("hint1 hint2");
		}

	</script>




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