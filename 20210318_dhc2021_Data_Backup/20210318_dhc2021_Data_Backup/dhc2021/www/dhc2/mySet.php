<?php
include_once('./_common.php');
if(!$member['mb_id']){
	alert2("회원만 가능한 메뉴입니다<br>로그인후 이용해 주세요");
}

$pageTitle="알림설정";
$is_page=1;
$is_setting=1;
include_once(G5_PATH.'/head.php');
?>

<div class="mySet">
	<div class="mb-2"><a href="./mySell.php" class="btn btn-outline-secondary"><sapn class="icon icon-arrow-left"></span> 나의분양으로</a></div>
	<?php 
	include_once "./sell_list.query.php";
	?>
</div>

<?php
include_once(G5_PATH.'/tail.php');
?>