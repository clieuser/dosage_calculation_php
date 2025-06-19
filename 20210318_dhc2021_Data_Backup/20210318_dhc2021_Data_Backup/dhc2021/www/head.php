<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가
run_event('pre_head');

include_once(G5_PATH.'/head.sub.php');
include_once(G5_LIB_PATH.'/latest.lib.php');
if(defined('_INDEX_')) { // index에서만 실행
	include G5_BBS_PATH.'/newwin.inc.php'; // 팝업레이어
}
?>
<div id="topMenu">
	<div class="tm_pc">
		<div class="logo"><a href="/index.php"><img src="/img/logo_h1.png"></a></div>
		<ul class="menu">
			<li><a href="/dhc/introduce.php">프로그램소개</a></li>
			<li><a href="/dhc/level0_basic.php"><?php echo LEVEL0_NAME;?></a></li>
			<li><a href="/dhc/level1_basic.php"><?php echo LEVEL1_NAME;?></a></li>
		</ul>
		<div class="member">
			<?php if($member['mb_id']){?>
				<a href="/dhc/mypage.php">MY PAGE</a>
				<a href="<?php echo G5_BBS_URL ?>/logout.php">LOG OUT</a>
			<?php }else{?>
				<a href="<?php echo G5_BBS_URL ?>/register.php">JOIN US</a>
				<a href="<?php echo G5_BBS_URL ?>/login.php">LOG IN</a>
								
			<?php }?>
		</div>
	</div>

	<!--  -->
	<div class="tm_mobile">
		<div class="logo">
			<a href="/index.php"><img src="/img/logo_h1.png" ></a>
		</div>

		<div class="menu"><a href="javascript:;" data-toggle="modal" data-target="#headModal"><i class="icons icon-menu"></i></a></div>
		
		
	</div>
</div>

<div class="modal fade left" id="headModal" tabindex="-1" role="dialog" aria-labelledby="headModalLabel" aria-hidden="true">
	<div class="modal-dialog  modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div class="mmHead">
					<a href="/index.php" class="logo"><img src="/img/logo_h1.gif" ></a>
					<a href="javascript:;" class="btnClose closeMenu"  data-dismiss="modal" aria-label="Close"><i class="icon icon-close"></i></a>
				</div>
			</div>

			<div class="modal-body">
				<div class="navbar-collapse accordion" id="mainMenu">
					<div id="mmMenu">
						<ul class="navbar-nav">
							<li><a href="/dhc/introduce.php">프로그램소개</a></li>
							<li><a href="/dhc/level0_basic.php"><?php echo LEVEL0_NAME1;?></a></li>
							<li><a href="/dhc/level1_basic.php"><?php echo LEVEL1_NAME1;?></a></li>
							
						</ul>

						<ul class="myNav">
						<?php if($member['mb_id']){?>
								<?php if (false && $is_admin=="super") {  ?>
								<li><a href="/adm/index.php"><span class="icon icon-heart"></span><br>관리자</a></li>
								<?php }  ?>
								<li><a href="/dhc/mypage.php"><span class="icon icon-heart"></span><br>마이페이지</a></li>
								<li><a href="<?php echo G5_BBS_URL ?>/logout.php"><span class="icon icon-heart"></span><br>로그아웃</a></li>
							<?php }else{?>
								<li><a href="<?php echo G5_BBS_URL ?>/login.php"><span class="icon icon-heart"></span><br>로그인</a></li>
								<li><a href="<?php echo G5_BBS_URL ?>/register.php"><span class="icon icon-heart"></span><br>회원가입</a></li>		
							<?php }?>
						</ul>
						
						<?php if(G5_IS_MOBILE){?>
						<div class="text-center my-3 cdcBtn">
							<a href="/cdc.apk" class="btn btn-lg btn-info" target="_blank"><i class="fa fa-download" aria-hidden="true"></i> 안드로이드 앱 다운</a>
						</div>
						<?php }?>
					</div>
				</div>

			</div><!-- body -->
		</div><!-- content -->
	</div><!-- dialog -->
</div>

<div id="headPadding">&nbsp;</div>

<?php if(!$is_index){?>
	<div class="container pageCont">
		<div class="pageBody">
<?php }?>

<?php if($pageTitle){?>
		<div class="pageTitle">
		<!-- <div class="titleLogo"><img src="/img/title_top_icon.png"></div> -->
			<div class="titleName"><?php echo $pageTitle;?></div>
		</div>
<?php }?>