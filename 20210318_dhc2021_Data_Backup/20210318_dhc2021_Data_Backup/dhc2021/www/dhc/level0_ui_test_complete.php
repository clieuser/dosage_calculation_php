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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

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
	<div id="examQ" class="examDiv active"><table class="exam_list">
		<tbody><tr class="head">
	<td class="num">No.</td>
	<td class="subject">문제</td>
	<td class="arrow"></td>
	<td class="answer">변환</td>
	</tr>
	
	<tr class="exam0 examTr examTrue">
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

	</tr><tr class="exam2 examTr examTrue">
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

	</tr><tr class="exam4 examTr examTrue">
		<td class="num">5</td>
		<td class="subject">4989 <span class="unit">sec</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[4]" value="22">
		<input type="hidden" name="exam_subject[4]" value="4989">
		<input type="text" name="exam_answer[4]" id="exam_answer4" value="3" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">min</span>
		</td>
	
		</tr>






<tr class="exam0 examTr examTrue">
		<td class="num">6</td>
		<td class="subject">6595 <span class="unit">cm</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[0]" value="25">
		<input type="hidden" name="exam_subject[0]" value="6595">
		<input type="text" name="exam_answer[0]" id="exam_answer0" value="" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">m</span>
		</td>

	</tr><tr class="exam1 examTr examTrue">
		<td class="num">7</td>
		<td class="subject">732 <span class="unit">hr</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[1]" value="19">
		<input type="hidden" name="exam_subject[1]" value="732">
		<input type="text" name="exam_answer[1]" id="exam_answer1" value="11" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">min</span>
		</td>

	</tr><tr class="exam2 examTr examTrue">
		<td class="num">8</td>
		<td class="subject">1945 <span class="unit">ng</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[2]" value="12">
		<input type="hidden" name="exam_subject[2]" value="1945">
		<input type="text" name="exam_answer[2]" id="exam_answer2" value="22" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">µg</span>
		</td>

	</tr><tr class="exam3 examTr examTrue">
		<td class="num">9</td>
		<td class="subject">2553 <span class="unit">µg</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[3]" value="11">
		<input type="hidden" name="exam_subject[3]" value="2553">
		<input type="text" name="exam_answer[3]" id="exam_answer3" value="22" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">ng</span>
		</td>

	</tr><tr class="exam4 examTr examTrue">
		<td class="num">10</td>
		<td class="subject">4989 <span class="unit">sec</span></td>
		<td class="arrow">=&gt;</td>
		<td class="answer">
		<input type="hidden" name="exam_wr_id[4]" value="22">
		<input type="hidden" name="exam_subject[4]" value="4989">
		<input type="text" name="exam_answer[4]" id="exam_answer4" value="3" class="exam_answer required " required="" maxlength="15" readonly="">
		<span class="unit resultUnit ">min</span>
		</td>
	
		</tr>


		
		
		</tbody></table>

			<div class="totalGrade">
			100
			</div>
		</div>

		
	
	
	
	<div id="examR" class="examDiv active"><div class="nextStep">
		<ul>
			<li>
				<button type="button" class="btn btn-lg btn-success"><?php echo LEVEL0_NAME;?></button>
			</li>
		<li>
				<button type="button" class="btn btn-lg btn-primary" onclick="location.href='./level1_ui_test1.php'"><?php echo LEVEL1_NAME;?></button>
			</li>
		</ul>
	</div>

	<div id="examC" class="examDiv active">
			<?php 
			echo LEVEL1_NAME." 및 테스트 과정을 통과하셨습니다.<br> 
			".LEVEL0_NAME.", ".LEVEL0_NAMES." 테스트를 하셔도 되십니다<br>
			".LEVEL1_NAME."을 연습하실 수 있습니다."; 
			?>

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