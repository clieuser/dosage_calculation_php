<?php
include_once('./_common.php');
if(!$member['mb_id']){
	alert("단위환산 테스트는 회원만 접근가능합니다.\\n회원이시라면 로그인 후 이용해주세요.", G5_BBS_URL.'/login.php?'.$qstr.'&amp;url='.urlencode($_SERVER['SCRIPT_NAME']));
}
$pageTitle="단위환산 테스트";
include_once(G5_PATH.'/head.php');

$nav_id=2;
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

	<div class="level_head">
		
		<div class="swCon">
			<div class="ssTitle">테스트 진행시간</div>
			<div class="timer well">00:00:32</div>
		</div>
	</div>	



	<!-- ####################
	시험문제를 정의
	#####################-->
	<div id="examQ" class="examDiv active">
	<table class="exam_list">
<tbody><tr class="head">
	<td class="num">No.</td>
	<td class="subject">문제</td>
	<td class="arrow"></td>
	<td class="answer">변환</td>
	</tr><tr class="exam0 examTr ">
		<td class="num">1</td>
		<td class="subject">7253 <span class="unit">ng</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[0]" value="6">
		<input type="hidden" name="exam_subject[0]" value="7253">
		<input type="text" name="exam_answer[0]" id="exam_answer0" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">mcg</span>
		</td>

	</tr><tr class="exam1 examTr ">
		<td class="num">2</td>
		<td class="subject">1356 <span class="unit">mcg</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[1]" value="4">
		<input type="hidden" name="exam_subject[1]" value="1356">
		<input type="text" name="exam_answer[1]" id="exam_answer1" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">mg</span>
		</td>

	</tr><tr class="exam2 examTr ">
		<td class="num">3</td>
		<td class="subject">7354 <span class="unit">mm</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[2]" value="27">
		<input type="hidden" name="exam_subject[2]" value="7354">
		<input type="text" name="exam_answer[2]" id="exam_answer2" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">m</span>
		</td>

	</tr><tr class="exam3 examTr ">
		<td class="num">4</td>
		<td class="subject">3439 <span class="unit">min</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[3]" value="21">
		<input type="hidden" name="exam_subject[3]" value="3439">
		<input type="text" name="exam_answer[3]" id="exam_answer3" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">sec</span>
		</td>

	</tr><tr class="exam4 examTr ">
		<td class="num">5</td>
		<td class="subject">3490 <span class="unit">mL</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[4]" value="14">
		<input type="hidden" name="exam_subject[4]" value="3490">
		<input type="text" name="exam_answer[4]" id="exam_answer4" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">L</span>
		</td>

		</tr>





	<tr class="exam0 examTr ">
		<td class="num">6</td>
		<td class="subject">7253 <span class="unit">ng</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[0]" value="6">
		<input type="hidden" name="exam_subject[0]" value="7253">
		<input type="text" name="exam_answer[0]" id="exam_answer0" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">mcg</span>
		</td>

	</tr><tr class="exam1 examTr ">
		<td class="num">7</td>
		<td class="subject">1356 <span class="unit">mcg</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[1]" value="4">
		<input type="hidden" name="exam_subject[1]" value="1356">
		<input type="text" name="exam_answer[1]" id="exam_answer1" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">mg</span>
		</td>

	</tr><tr class="exam2 examTr ">
		<td class="num">8</td>
		<td class="subject">7354 <span class="unit">mm</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[2]" value="27">
		<input type="hidden" name="exam_subject[2]" value="7354">
		<input type="text" name="exam_answer[2]" id="exam_answer2" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">m</span>
		</td>

	</tr><tr class="exam3 examTr ">
		<td class="num">9</td>
		<td class="subject">3439 <span class="unit">min</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[3]" value="21">
		<input type="hidden" name="exam_subject[3]" value="3439">
		<input type="text" name="exam_answer[3]" id="exam_answer3" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">sec</span>
		</td>

	</tr><tr class="exam4 examTr ">
		<td class="num">10</td>
		<td class="subject">3490 <span class="unit">mL</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[4]" value="14">
		<input type="hidden" name="exam_subject[4]" value="3490">
		<input type="text" name="exam_answer[4]" id="exam_answer4" value="" class="exam_answer required " required="" maxlength="15">
		<span class="unit resultUnit ">L</span>
		</td>
		</tr>
		</tbody></table>

		<div class="text-center my-3 examSubmitBox">
			<input type="hidden" name="pr_id" value="1">
			<button type="submit" class="btn btn-lg btn-primary examSubmit" onclick="location.href='./level0_ui_test_result.php'">입력완료</button>
		</div>
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