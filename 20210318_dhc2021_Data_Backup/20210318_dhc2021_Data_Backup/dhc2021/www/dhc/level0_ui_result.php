<?php
include_once('./_common.php');
if(!$member['mb_id']){
	alert("단위환산 트레이닝은 회원만 접근가능합니다.\\n회원이시라면 로그인 후 이용해주세요.", G5_BBS_URL.'/login.php?'.$qstr.'&amp;url='.urlencode($_SERVER['SCRIPT_NAME']));
}
$pageTitle="단위환산 트레이닝";
include_once(G5_PATH.'/head.php');

$nav_id=1;
include_once "./level0_head.php";

$prow=exam_level0_prow(); 


//시험문제수
$examCnt=exam_cnt("level0");

//저장내용을 불러온다
$row=exam_level0_bakupdata();

//초기 진행률을 계산
$examPer=0;
if($row['pr_id']){
	if($row['pr_end']){
		$examPer=100;
	}else{
		$counter = exam_level0_pass_cnt($row['pr_id']); 
		if($counter){
			//진행률을 정의한다.
			$examPer=100-intval( ($counter / $examCnt) * 100 ); 
		}
	}
}
$examPer=65;
?>
<!-- ************************
// 내용을 등록해 주세요 
************************-->
<div id="examCon">
	<!-- 현재 상태를 정의한다 -->
	<div id="examC" class="examDiv active">
		기초 트레이닝 및 테스트 과정을 통과하셨습니다.<br> 
			기초 트레이닝연습, 기초 테스트를 하셔도 되시고<br>
			약물용량 계산을 연습하실 수 있습니다.	</div>

	<div class="level_head">
		<div>
			<div class="ssTitle">트레이닝 진행율</div>
			<div class="pieCon">
				<div class="pie_progress" role="progressbar" data-goal="100" aria-valuemin="0" aria-valuemax="100">
				  <span class="pie_progress__number">0%</span>
				</div>
			</div>
		</div>
		
		<div class="swCon">
			<div class="ssTitle">트레이닝 진행시간</div>
			<div class="timer well">00:00:32</div>
		</div>
	</div>	



	<!-- ####################
	시험문제를 정의
	#####################-->
	<form id="formLevel0" name="formLevel0" onsubmit="return level0Submit()">
	<input type="hidden" name="bo_table" value="level0">
	<input type="hidden" name="wType" value="level0_check">
	<div id="examQ" class="examDiv active"><table class="exam_list">
<tbody><tr class="head">
	<td class="num">No.</td>
	<td class="subject">문제</td>
	<td class="arrow"></td>
	<td class="answer">변환</td>
	</tr><tr class="exam0 examTr examFalse">
		<td class="num">1</td>
		<td class="subject">6595 <span class="unit">cm</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[0]" value="25">
		<input type="hidden" name="exam_subject[0]" value="6595">
		<input type="text" name="exam_answer[0]" id="exam_answer0" value="" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">m</span>
		</td>

	</tr><tr class="exam1 examTr examTrue">
		<td class="num">2</td>
		<td class="subject">732 <span class="unit">hr</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[1]" value="19">
		<input type="hidden" name="exam_subject[1]" value="732">
		<input type="text" name="exam_answer[1]" id="exam_answer1" value="11" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">min</span>
		</td>

	</tr><tr class="exam2 examTr examFalse">
		<td class="num">3</td>
		<td class="subject">1945 <span class="unit">ng</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[2]" value="12">
		<input type="hidden" name="exam_subject[2]" value="1945">
		<input type="text" name="exam_answer[2]" id="exam_answer2" value="22" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">µg</span>
		</td>

	</tr><tr class="exam3 examTr examTrue">
		<td class="num">4</td>
		<td class="subject">2553 <span class="unit">µg</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[3]" value="11">
		<input type="hidden" name="exam_subject[3]" value="2553">
		<input type="text" name="exam_answer[3]" id="exam_answer3" value="22" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">ng</span>
		</td>

	</tr><tr class="exam4 examTr examFalse">
		<td class="num">5</td>
		<td class="subject">4989 <span class="unit">sec</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[4]" value="22">
		<input type="hidden" name="exam_subject[4]" value="4989">
		<input type="text" name="exam_answer[4]" id="exam_answer4" value="3" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">min</span>
		</td>

	</tr></tbody></table>
<div class="text-center my-3 examSubmitBox" style="display: none;">
<input type="hidden" name="pr_id" value="1">
<button type="submit" class="btn btn-lg btn-primary examSubmit">입력완료</button>
</div></div>
	</form>



	<!-- 시험결과를 정의 -->
	<div id="examR" class="examDiv active"><div class="nextStep">
	<ul>
		<li>
			<button type="button" class="btn btn-lg btn-success">트레이닝 계속</button>
		</li>
	<li>
			<button type="button" class="btn btn-lg btn-primary">테스트 하기</button>
		</li>
	</ul>
</div>

	<style>

	</style>

<div class="error_list alert alert-danger">
		<div class="rsTitle">오답노트</div>
		<ul><li>
		<div class="num">1. </div>
		<div class="resultCon">
			<div class="result">RESULT : 6595cm 은 6.595m 입니다.</div>
			<div class="hint">HINT : 1cm은 0.01m 입니다.</div>
		</div>
		</li>
		<li>
		<div class="num">3. </div>
		<div class="resultCon">
			<div class="result">RESULT : 1945ng 은 1.945µg 입니다.</div>
			<div class="hint">HINT : 1ng은 0.001µg 입니다.</div>
		</div>
		</li><li>
		<div class="num">5. </div>
		<div class="resultCon">
			<div class="result">RESULT : 4989sec 은 84.813min 입니다.</div>
			<div class="hint">HINT : 1sec은 0.017min 입니다.</div>
		</div>
		</li></ul>
	</div></div>

	<!-- ####################
	시험버튼을 정의한다
	#####################-->
	<div id="examB" class="examDiv examBtn">
		<ul>
			<li id="examStart"><button type="button" class="btn btn-lg btn-success">트레이닝 시작하기</button></li>
			
			<li id="examRestart"><button type="button" class="btn btn-lg btn-info">트레이닝 처음부터 시작하기</button></li>
		</ul>
	</div>

		<div id="examT" class="examDiv examBtn">
		<ul>
			<li id="examTest"><button type="button" class="btn btn-lg btn-primary ">기초 테스트 하기</button></li>
		</ul>
	</div>

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