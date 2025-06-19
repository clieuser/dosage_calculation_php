<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가
?>

	<?php if($is_page){?>
		</div><!-- pageBody -->
	</div><!-- pageCont -->
	<?php }?>
</div><!-- end  pageCon -->

<?php if(!G5_IS_MOBILE){?>
<div id="indexFooter">
대구보건대학교  | 문의 : 053-320-1300 
</div>
<?php }?>

<!-- 하단 메뉴를 정의한다 -->
<div id="bottomCon">
	<div class="bottomPadding"></div>
	<div class="bottomBox">
		<?php if($is_main){?>
		<ul class="bottomMenu">
			<li>
				<a href="/index.php">
					<div class="bp_icon" style="background-image:url('/images/bp_home_icon.png');"></div>
					<div class="bp_title">홈</div>
				</a>
			</li>
			<li>
				<a href="/alio/mySell.php">
					<div class="bp_icon" style="background-image:url('/images/bp_heart_icon.png');"></div>
					<div class="bp_title">관심분양</div>
				</a>
			</li>
			<li>
				<a href="/alio/sell_map.php">
					<div class="bp_icon" style="background-image:url('/images/bp_map_icon.png');"></div>
					<div class="bp_title">지도</div>
				</a>
			</li>
			<li>
				<a href="/alio/sell_list.php">
					<div class="bp_icon" style="background-image:url('/images/bp_sell_icon.png');"></div>
					<div class="bp_title">즉시입주가능</div>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-toggle="modal" data-target="#headModal">
					<div class="bp_icon" style="background-image:url('/images/bp_more_icon.png');"></div>
					<div class="bp_title">더보기</div>
				</a>
			</li>
		</ul>

		<?php }?>
		
		
	</div>
	<!-- 하단 메뉴를 정의한다 END -->
</div>

<button type="button" id="top_btn"><i class="fa fa-arrow-up" aria-hidden="true"></i><span class="sound_only">상단으로</span></button>
<?php

if ($config['cf_analytics']) {
	echo $config['cf_analytics'];
}
?>
<script>
jQuery(function($) {

    $( document ).ready( function() {

        // 폰트 리사이즈 쿠키있으면 실행
        font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
        
        //상단고정
		$( window ).scroll( function() {
			var top=$( document ).scrollTop(); 
			if(top>50){jQuery("body").addClass("on");}
			else{jQuery("body").removeClass("on");}

		});

        //상단으로
        $("#top_btn").on("click", function() {
            $("html, body").animate({scrollTop:0}, '500');
            return false;
        });
	});
});
</script>

<?php
if($is_index==1) { // index에서만 실행
	@include G5_MOBILE_PATH.'/newwin2.inc.php'; // 팝업레이어
}
?>

<?php if($is_map){?>
<script type="text/javascript" src="/js/map.js?ver=<?php echo G5_CSS_VER;?>"></script>
<?php }?>
<?php
include_once(G5_PATH."/tail.sub.php");
?>