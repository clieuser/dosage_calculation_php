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
		
		<div class="level1_submit level1_submit2 mb-2  examTrue">
			<div>
				<span class="num">1. </span> 
				<input type="text" name="" value="2100" readonly disabled>
				<span class="unit unit_result">mg</span>
			</div>
		</div>
		<div class="level1_submit level1_submit2 mb-2  examTrue">
			<div>
			<span class="num">2. </span> <input type="text" name="" value="200" readonly disabled>
			<span class="unit unit_result">ml</span>
			</div>
		</div>
		<div class="level1_submit level1_submit2 mb-2  examFalse">
			<div>
			<span class="num">3. </span>
			<input type="text" name="" value="3400" readonly disabled>
			<span class="unit unit_result">gtt/min</span>
			</div>
		</div>
		<div style="width:100%;">
			<button type="button" class="btn btn-lg btn-primary" onclick="location.href='level1_ui_test1_5.php'" style="width:100%;">답변 제출</button>		
		</div>
	</div>


<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

	<div class="level1_hint">
			<button type="button" class="btn btn-lg btn-info mr-2" >동일 유형 문제 풀기</button>
			<button type="button" class="btn btn-lg btn-success" onclick="location.href='level1_ui_test1_3.php'">다음 문제 풀기</button>		
		</div>

		<div class="alert alert-danger text-left">
			<div class="text-bold mb-2"></div>
			<ul class="ex_mathBox">
				<li class="ex_title">계산기본 공식</li>
				<li class="ex_num">6-1</li>
				<li class="ex_math">
						<div>
							0.5% Lidocaine 5 mg / mL<br>
							1% Lidocaine  10 mg/mL<br>
							2% Lidocaine  20 mg/mL
						</div>
				</li>
				<li class="ex_num">6-2</li>
				<li class="ex_math">
						<div>
							투여량=  (처방 용량)/(패키지 용량)
						</div>
				</li>
				<li class="ex_num">6-3</li>
				<li class="ex_math">
						<div>1분당 방울 수(gtt/min)</div>
						<div >$$ = \frac{(시간당 주입량 (ml/hr)×20(gtt))}{(60(min.))} $$
						</div>
				</li>


				<li class="ex_title">풀이</li>
				<li class="ex_num">6-1</li>
				<li class="ex_math">
						<div>
							2% Lidocaine  20 mg/mL
						</div>
				</li>
				<li class="ex_num">6-2</li>
				<li class="ex_math">
						<div>	투여량 (mL)</div>
						<div>
							$$ = \frac{처방용량  100 (mg)/2 min}{패키지용량 20 (mg) / (mL) } $$</div>
						<div>= 2.5 (mL)</div>
				</li>
				<li class="ex_num">6-3</li>
				<li class="ex_math">
						<div>1분당 방울 수(gtt/min)</div>
						<div >$$ = \frac{2.5(ml/min)×60 (min)×20(gtt)}{60(min)} $$
						</div>
						<div >= 50 (gtt/min)</div>
				</li>
			</ul>
			<style>
				mjx-container[jax="CHTML"][display="true"]{text-align:left;font-size:110% !important;color:black;}
			.ex_mathBox .ex_math{text-align:left;font-size:13px;line-height:25px;color:black;}
			.ex_mathBox .ex_title{font-size:18px;margin-bottom:10px;font-weight:bold;}
			.ex_mathBox .ex_num{margin-bottom:10px;}
			.ex_mathBox .ex_math{margin-bottom:20px;}
			</style>
		</div>
	</div>


	</form>





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