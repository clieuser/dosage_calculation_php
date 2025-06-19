<?php 
add_stylesheet('<link rel="stylesheet" href="'.$board_com_url.'/style.css?ver='.time().'">', 0);

if($group['gr_id']=="ebook"){
	include_once $board_com_path."/list_ebook.skin.php";
}
?>

<!-- 게시판 카테고리 시작 { -->
    <?php if ($is_category) { ?>
    <nav id="bo_cate">
        <h2><?php echo $board['bo_subject'] ?> 카테고리</h2>
        <ul id="bo_cate_ul">
            <?php echo $category_option ?>
        </ul>
    </nav>
    <?php } ?>
	<?php if($bo_table=="mainbanner"){?>
	<form name="fsearch" id="fsearch" method="post" action="./board.php">
	<input type="hidden" name="bo_table" value="<?php echo $bo_table ?>">
	<input type="hidden" name="sfl" value="wr_3">
	<input type="hidden" name="spt" value="<?php echo $spt ?>">
	<input type="hidden" name="sca" value="<?php echo $sca ?>">
	<input type="hidden" name="sst" value="<?php echo $sst ?>">
	<input type="hidden" name="sod" value="<?php echo $sod ?>">
	<input type="hidden" name="page" value="<?php echo $page ?>">
	<div>
	<select name="stx" class="selectChange">
	<option value="">위치선택</option>
		<?php 
		$counter = count($g5['mainBanner']);
		for($m=1;$m<$counter;$m++){
			echo "<option value='{$m}' ".(($m==$stx)?'selected':'').">".$g5['mainBanner'][$m]."</option>"; 
		}
		?>
	</select>
	<script type="text/javascript">
	<!--
		jQuery(document).ready(function(){
			jQuery(".selectChange").on("change", function(){
				jQuery("#fsearch").submit();
			});
		});
	//-->
	</script>
	</div>
	</form>
	<?php }?>
    <!-- } 게시판 카테고리 끝 -->
    <form name="fboardlist" id="fboardlist" action="<?php echo G5_BBS_URL; ?>/board_list_update.php" onsubmit="return fboardlist_submit(this);" method="post">
    
    <input type="hidden" name="bo_table" value="<?php echo $bo_table ?>">
    <input type="hidden" name="sfl" value="<?php echo $sfl ?>">
    <input type="hidden" name="stx" value="<?php echo $stx ?>">
    <input type="hidden" name="spt" value="<?php echo $spt ?>">
    <input type="hidden" name="sca" value="<?php echo $sca ?>">
    <input type="hidden" name="sst" value="<?php echo $sst ?>">
    <input type="hidden" name="sod" value="<?php echo $sod ?>">
    <input type="hidden" name="page" value="<?php echo $page ?>">
    <input type="hidden" name="sw" value="">

    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
    <div id="bo_btn_top">
        <div id="bo_list_total">
            <span>Total <?php echo number_format($total_count) ?>건</span>
            <?php echo $page ?> 페이지
        </div>
        <ul class="btn_bo_user">
        	<?php if ($admin_href) { ?><li class='adminBtn'><a href="<?php echo $admin_href ?>" class="btn_admin btn" title="관리자"><i class="fa fa-cog fa-spin fa-fw"></i>관리자</a></li><?php } ?>
			<li>
				<button type="button" class="btn_bo_sch btn_b01 btn" title="게시판 검색"><i class="fa fa-search" aria-hidden="true"></i> 검색</button>
			</li>
			<?php if ($write_href) { ?><li><a href="<?php echo $write_href ?>" class="btn_b01 btn" title="문제등록"><i class="fa fa-pencil" aria-hidden="true"></i> 문제등록</a></li><?php } ?>
        </ul>
    </div>