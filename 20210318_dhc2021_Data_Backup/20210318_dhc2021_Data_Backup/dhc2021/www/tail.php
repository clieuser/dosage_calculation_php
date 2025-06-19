<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

?>

<?php if(!$is_index){?>
	</div><!-- pageCon -->
</div><!-- pageCon -->
<?php }?>
<!-- pageCont -->
<script>
$(function() {
	$("#top_btn").on("click", function() {
		$("html, body").animate({scrollTop:0}, '200');
		return false;
	});
});
</script>

<!-- 하단 메뉴를 정의한다 -->
<div id="bottomCon">
	<div class="bottomPadding"></div>
	<div class="bottomBox" id="bottomBoxFix">
		<ul class="bottomMenu">
			<li>
				<a href="/index.php">
					<div class="bp_icon"><img src="/img/icon_home2.jpg"></div>
					<div class="bp_title">HOME</div>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-toggle="modal" data-target="#headModal">
					<div class="bp_icon"><img src="/img/icon_category2.jpg"></div>
					<div class="bp_title">카테고리</div>
				</a>
			</li>
			<li>
				<a href="/dhc/level0_basic.php">
					<div class="bp_icon" ><img src="/img/icon_level0_2.jpg"></div>
					<div class="bp_title"><?php echo LEVEL0_NAMES;?></div>
				</a>
			</li>
			<li>
				<a href="/dhc/level1_basic.php">
					<div class="bp_icon" ><img src="/img/icon_level1_2.jpg"></div>
					<div class="bp_title"><?php echo LEVEL1_NAMES;?></div>
				</a>
			</li>
			<li>
				<a href="/dhc/mypage.php">
					<div class="bp_icon" ><img src="/img/icon_mypage2.jpg"></div>
					<div class="bp_title">MyPage</div>
				</a>
			</li>
		</ul>
	</div>
	<!-- 하단 메뉴를 정의한다 END -->
</div>
<script>
var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
	var currentScrollPos = window.pageYOffset;
	if (prevScrollpos > currentScrollPos) {
		document.getElementById("bottomBoxFix").style.bottom = "0";
	} else {
		document.getElementById("bottomBoxFix").style.bottom = "-90px";
	}
	prevScrollpos = currentScrollPos;
}
</script>
<?php if(false){?>
<button type="button" id="top_btn"><i class="fa fa-arrow-up" aria-hidden="true"></i><span class="sound_only">상단으로</span></button>
<?php }?>

<?php
if(G5_DEVICE_BUTTON_DISPLAY && !G5_IS_MOBILE) { ?>
<?php
}

if ($config['cf_analytics']) {
    echo $config['cf_analytics'];
}
?>

<!-- } 하단 끝 -->

<script>
$(function() {
    // 폰트 리사이즈 쿠키있으면 실행
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
});
</script>

<?php
include_once(G5_PATH."/tail.sub.php");
?>
