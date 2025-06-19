<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가
// 선택옵션으로 인해 셀합치기가 가변적으로 변함
// add_stylesheet('css 구문', 출력순서); 숫자가 작을 수록 먼저 출력됨
?>

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:<?php echo $width; ?>">
	
	<?php
	//상단을 정의
	include_once $board_com_path."/list_head.skin.php";
	?>
	<style>
		.tbl_head01 thead th{padding:10px;text-align:center;background-color:#f3f3f3;}
		.table_list td{border:1px solid #aaa; text-align:center;padding:5px 5px;}
		#bo_list .tbl_head01 td{border:1px solid #aaa;}
		.table_list td select, .table_list td input[type='text']{width:100%;height:35px;}
		.table_list input[type='checkbox']{width:25px;height:25px;}
	</style>
    <div class="tbl_head01 tbl_wrap">
        <table class="table_list">
        <thead>
        <tr>
            <?php if ($is_checkbox) { ?>
            <th scope="col" style="width:60px;">
            	<input type="checkbox" id="chkall" onclick="if (this.checked) all_checked(true); else all_checked(false);">
                <label for="chkall">
                	<span></span>
                	<b class="sound_only">현재 페이지 게시물  전체선택</b>
				</label>
            </th>
            <?php } ?>
            <th scope="col" style="width:100px;">상태</th>
			<th scope="col" style="width:100px;">분류</th>
			<th scope="col" style="width:250px;">변환</th>
			
            <th scope="col" style="width:80px;">배수</th>
			<th scope="col" style="width:80px;">소수자리</th>
			<th scope="col" style="width:80px;">순서</th>
			<th scope="col">설명</th>
			<th scope="col" style="width:80px;">관리</th>
		</tr>
        </thead>

        <tbody>
        <?php 
		$ca_name_option=$type_option="";
		$type_array=array("무게","부피","시간","길이");
		foreach($type_array as $value){
			$type_option.="<option value='{$value}'>{$value}</option>";
		}
		$ca_name_option="<option value='사용'>사용</option><option value='미사용'>미사용</option>";	
        for ($i=0; $i<count($list); $i++) {
		?>
        <tr>
            <?php if ($is_checkbox) { ?>
            <td>
				<input type="hidden" name="update_wr_id[<?php echo $i;?>]" value="<?php echo $list[$i]['wr_id'] ?>"> 
				<input type="checkbox" name="chk_wr_id[]" value="<?php echo $list[$i]['wr_id'] ?>" id="chk_wr_id_<?php echo $i ?>" >
            	<label for="chk_wr_id_<?php echo $i ?>">
            		<span></span>
            		<b class="sound_only"><?php echo $list[$i]['subject'] ?></b>
            	</label>
            </td>
            <?php } ?>
            <td>
				<input type="hidden" name="update_wr_id[<?php echo $i;?>]" value="<?php echo $list[$i]['wr_id'];?>">
				<select name="ca_name[<?php echo $i;?>]">
				<?php 
					echo str_replace("value='".$list[$i]['ca_name']."'", "value='".$list[$i]['ca_name']."' selected", $ca_name_option);
				?>
				</select>
			</td>
			<td>
				<select name="wr_1[<?php echo $i;?>]" >
				<?php 
					echo str_replace("value='".$list[$i]['wr_1']."'", "value='".$list[$i]['wr_1']."' selected", $type_option);
				?>
				</select>
			</td>
			<td>
				<input type="text" name="wr_subject[<?php echo $i;?>]"  value="<?php echo $list[$i]['wr_subject'];?>">
			</td>
			

			<td>
				<input type="text" name="wr_2[<?php echo $i;?>]"  value="<?php echo $list[$i]['wr_2'];?>">
			</td>

			<td>
				<input type="text" name="wr_3[<?php echo $i;?>]"  value="<?php echo $list[$i]['wr_3'];?>">
			</td>
			
			<td>
				<input type="text" name="wr_good[<?php echo $i;?>]"  value="<?php echo $list[$i]['wr_good'];?>">
			</td>

			<td>
				<input type="text" name="wr_content[<?php echo $i;?>]"  value="<?php echo $list[$i]['wr_content'];?>">
			</td>
			<td>
				 <a href="<?php echo $list[$i]['href'] ?>">관리</a>
			</td>
        </tr>
        <?php } ?>
        </tbody>
        </table>
    </div>
	

	<?php
	//하단을 정의
	include_once $board_com_path."/list_tail.skin.php";
	?>