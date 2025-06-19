<?php
include_once('./_common.php');
$is_page=1;
$is_like=0;
$is_sell=1;
$pageTitle="임대공고";

include_once(G5_PATH.'/head.php');
?>
<!-- 공고 검색을 정의한다 -->
<form name="fsearch" id="fsearch"  method="post" action="./sell_list.php">
<input type="hidden" name="sca" value="<?php echo $sca;?>">
<div class="searchText">
	<div class="header">공고명</div>
	<input type="text" name="stx" value="<?php echo $stx;?>">
	<button type="submit"><span class="icon icon-magnifier"></span></button>
</div>
</form>
<!-- END 공고 검색을 정의한다 -->

<ul class="cateNav">
<?php 
$sca_array=array("접수중","접수마감","기타");
echo "<li class=''><a href='./sell_list.php'  class='".(( !in_array($sca,$sca_array) )?"on":"")."'>전체</a></li>"; 
$counter=count($sca_array);
for($i=0;$i<$counter;$i++)
{
	echo "<li><a href='./sell_list.php?sca=".urlencode($sca_array[$i])."' class='".(($sca_array[$i]==$sca)?'on':'')."'>".$sca_array[$i]."</a></li>"; 
}
?>
</ul>
<?php if($sarea){?>
<div class="my-1 searchArea" >검색 지역 : <?php echo $sarea;?></div>
<?php }?>


<ul class="dataList" id="dataList">
	<?php 
	$is_first_list=1;
	include_once "./sell_list.sub.php";
	echo $str;
	?>
</ul>


<?php
include_once "./sell_list.more.php";
?>


<?php
include_once "./sell_detail.php";
?>


<?php
include_once(G5_PATH.'/tail.php');
?>