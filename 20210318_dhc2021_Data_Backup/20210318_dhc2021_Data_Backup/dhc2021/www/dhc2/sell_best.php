<?php
include_once('./_common.php');
$is_page=1;
$is_like=0;
$is_sell_best=1;
$is_sell=1;
$pageTitle="추천임대공고";

include_once(G5_PATH.'/head.php');
?>


<ul class="dataList" id="dataList">
	<?php 
	$is_first_list=1;
	include_once "./sell_list.sub.php";
	//echo $sql;
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