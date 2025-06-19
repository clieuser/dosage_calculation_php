<?php
include_once('./_common.php');
$pageTitle=LEVEL1_NAME;

include_once "./_member_check.php"; 


$pageTitle=LEVEL1_NAMES." 기초정보";

include_once(G5_PATH.'/head.php');

$nav_box=1;
$nav_id=0;

include_once "./level1_head.php";
?>
<!-- ************************
// 내용을 등록해 주세요 
************************-->
<div class="basic_con">
	<div>
		<img src="/img/basic_top_icon.png">
	</div>
	<!-- <div class="basic_stitle">
	약물처방에 대한 계산 능력을 향상시킨다.
	</div> -->
	<div class="basic_cont">
		<div class="alert alert-primary">
			<h5>1. 기초과정</h5>
			<div>
			가장 기초가 되는 약물 용량 관련 단위들 간의  환산 
			능력을 재점검 합니다.
			</div>
		</div>

		<div class="alert alert-info">
			<h5>2. 초급과정</h5>
			<div>
				약물용량계산이 요구되는 시나리오에서 어떤 
				정보가 계산에 필요한지를 힌트를 통해 찾고 계산
				하는 훈련을 집중적으로 합니다.
			</div>
		</div>

		<div class="alert alert-success">
			<h5>3. 중급과정</h5>
			<div>
			이렇게 키운 능력을 바탕으로 실제 시험에 나오는 
			시나리오의 계산 능력을 확인합니다.
			</div>
		</div>

		<div class="alert alert-danger">
			<h5>4. 고급과정 (예정)</h5>
			<div>
			실제 병원에서 이용되는 환자정보 및 의사처방 
			EMR정보를 보며, 병원 현장에서의 계산능력을 
			완성시킵니다.
			</div>
		</div>
	</div>
	
	<h4 class="text-center">자, 그럼 이제 시작해볼까요?</h4>
	<div>
		<img src="../img/basic_icon1.jpg"></div>
	</div>

	<div class=" text-center">
		<a href="./level1.php" class="btn btn-success btn-lg level1_go_btn"><?php echo LEVEL1_NAME ;?> 시작하기</a>

	</div>
<!-- ************************
// END 내용을 등록해 주세요 
************************-->


<?php
include_once(G5_PATH.'/tail.php');
?>