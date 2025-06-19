<?php
include_once('./_common.php');
if(!$member['mb_id']){
	alert(LEVEL1_NAME."은 회원만 접근가능합니다.\\n회원이시라면 로그인 후 이용해주세요.", G5_BBS_URL.'/login.php?'.$qstr.'&amp;url='.urlencode($_SERVER['SCRIPT_NAME']));
}
$pageTitle=LEVEL1_NAME;
include_once(G5_PATH.'/head.php');


$nav_id=0;
$nav_box=0;
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

		
		<div class="level1_exam " >
			응급실에 <span class='hint1'>50</span>세 <span class='hint1'>남자</span> 환자 <span class='hint1'>A</span>가 실려왔다. 응급구조사에 따르면 그는 출근 도중 <span class='hint1'>가슴을 움켜쥐고 쓰려졌으며, 왼쪽 가슴에 심한 통증, 그리고 왼쪽 팔, 어깨 등에 방사통증</span>을 보이고 있다. 통증이 시작된지 <span class='hint1'>15</span>분이 지났다. <br>
			응급의학과 전문의는 <span class='hint1'>Morphine Sulfate <span class='hint2'>4 mg</span></span>을 처방하였다. 병원에 공급되는 <span class='hint1'>Morphine Sulfate</span> 제품은 <span class='hint2'>10 mg/cc</span> 이다.
			간호사는 의사 처방에 따라 몇 <span class='hint3'>mL</span>를 투여해야 하는가?
		</div>
		
		<div class="level1_submit">
			<input type="text" name="" value="2100" readonly disabled>
			<span class="unit">ml</span>
			<button type="button" class="btn btn-lg btn-info" onclick="location.href='level1_ui_test1_2.php'">답변 제출</button>		
		</div>

<style>


		</style>

		<div class="level1_hint">
			<button type="button" class="btn btn-lg btn-info mr-2" onclick="hint_view1()">힌트 보기</button>
			<button type="button" class="btn btn-lg btn-success" onclick="hint_view2()">추가힌트 보기</button>		
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