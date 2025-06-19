<?php
include_once('./_common.php');
if(!$member['mb_id']){
	alert2("회원만 가능한 메뉴입니다<br>로그인후 이용해 주세요");
}
$is_page=1;
$pageTitle="찜분양";
$is_like=1;
include_once(G5_PATH.'/head.php');
?>


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