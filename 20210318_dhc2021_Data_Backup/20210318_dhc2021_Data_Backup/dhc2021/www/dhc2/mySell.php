<?php
include_once('./_common.php');
$is_page=1;
$is_my=1;
$pageTitle="나의분양";
include_once(G5_PATH.'/head.php');
?>
<div class="mb-2 text-right">
	<a href="./mySet.php" class="btn btn-outline-secondary">나의분양설정 <sapn class="icon icon-arrow-right"></span></a>
</div>

<div class="mySell">
<?php 
include_once "./sell_list.query.php";
?>
</div>


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