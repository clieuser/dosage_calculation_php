<?php
include_once('./_common.php');
include_once "./_member_check.php"; 

$pageTitle="MY PAGE";
include_once(G5_PATH.'/head.php');

$test_level=0;
$level0_0_per=0; //변환
$level0_1_per=0; //test
$level1_0_per=0; //레벨1 상
$level1_1_per=0; //레벨1 중
$level1_2_per=0; //레벨1 하

if($member['mb_level']<=LEVEL0_LEVEL){
	$test_level=0;
	if($member['mb_level0']>0){
		$level0_0_per=100; //변환
		$level0_1_per=20; //test
	}else {
		$examCnt=exam_cnt("level0");
		$pr=$row=exam_level0_bakupdata();
		$counter=exam_level0_pass_cnt($pr['pr_id']); 
		if($counter){
			//진행률을 정의한다.
			$level0_0_per=intval( ($counter / $examCnt) * 100 ); 
		}
	}
}
else if($member['mb_level']<=LEVEL1_LEVEL){
	$test_level=1;
	$cate=0;
	if($member['mb_level0']>=2){
		$level1_0_per=$level1_1_per=100;
		$cate=2;
	}
	else if($member['mb_level0']>=1){
		$level1_0_per=100;
		$cate=1;
	}

	//진행사항을 불러온다
	$examPer = 0 ; 
	$pr=exam_level1_data($cate);
	if($pr['pr_cnt']){
		$examPer=intval(($pr['pr_cnt']/LEVEL1_PASS_CNT) * 100);
	}

	if($cate==2){
		$level1_2_per=$examPer;
	}
	else if($member['mb_level0']>=1){
		$level1_1_per=$examPer;
	}else {
		$level1_0_per=$examPer;
	}
}else{
	$level0_0_per=$level0_1_per=$level1_0_per=$level1_1_per=$level1_2_per=100;
	$test_level=10;
}
$progress=array();

$progress[]=array(LEVEL0_NAME, $level0_0_per, "orange"); 
$progress[]=array(LEVEL0_NAMES."테스트", $level0_1_per, "blue"); 
$progress[]=array(LEVEL1_NAME." ".$g5['level1_level'][0], $level1_0_per, "green"); 
$progress[]=array(LEVEL1_NAME." ".$g5['level1_level'][1], $level1_1_per, "navy"); 
$progress[]=array(LEVEL1_NAME." ".$g5['level1_level'][2], $level1_2_per, "red"); 
?>
<!-- ************************
// 내용을 등록해 주세요 
************************-->
<style>
.level_progress .progressbar-title{
    font-size: 14px;
    color: #848484;
    text-transform: capitalize;
}
.level_progress .progress{
    height: 5px;
    overflow: visible;
    background: #f0f0f0;
    margin-bottom: 40px;
}
.level_progress .progress .progress-bar{
    position: relative;
    animation: animate-positive 2s;
	overflow:visible;
}
.level_progress .progress .progress-icon{
    width: 30px;
    height: 30px;
    line-height: 25px;
    border-radius: 50%;
    font-size: 13px;
    position: absolute;
    top: -14px;
    right: 0;
    background: #fff;
    border-width: 3px;
    border-style: solid;
}
.level_progress .progress-value{
    font-size: 13px;
    color: #848484;
    position: absolute;
    top: 30px;
    right: -2px;
}
@-webkit-keyframes animate-positive {
    0% { width: 0%; }
}
@keyframes animate-positive {
    0% { width: 0%; }
}

</style>
<!-- progress bar -->
<div class="container level_progress">
    <div class="row">
        <div class="col-md-12">
			<?
			foreach($progress as $row){?> 
            <h3 class="progressbar-title"><?php echo $row[0];?></h3>
            <div class="progress">
                <div class="progress-bar" style="width: <?php echo $row[1];?>%; background: <?php echo $row[2];?>;">
                    <span class="progress-icon fa fa-check" style="border-color:<?php echo $row[2];?>; color:<?php echo $row[2];?>;"></span>
                    <div class="progress-value"><?php echo $row[1];?>%</div>
                </div>
            </div>
			<?php }?>
        </div>
    </div>
</div>

<div class="basic_con">
	<div class="basic_cont">
		<div class="alert alert-primary">
			<?php 
			if($test_level==10){?>
				<h5>전체과정을 수료</h5>
				<div> 축하드립니다!!!<br> 모든과정을 완료 하셨습니다. <br>
				<?php echo LEVEL0_NAME;?>, <?php echo LEVEL1_NAME;?>을 언제든지 테스트 하실수 있습니다.  
				</div>
			<?php }else if($test_level==1){?>
				<h5><?php echo LEVEL1_NAME;?> 진행중 </h5>
				<div>	
					<div>
				<?php echo LEVEL0_NAME;?>을 언제든지 테스트 하실수 있습니다.</div>
				</div>
			<?php }?>
		</div>
	</div>
</div>

<div>
<a href="/bbs/register_form.php?w=u" class="btn btn-lg btn-primary">내정보 수정하기</a>
</div>
<!-- ************************
// END 내용을 등록해 주세요 
************************-->
<?php
include_once(G5_PATH.'/tail.php');
?>