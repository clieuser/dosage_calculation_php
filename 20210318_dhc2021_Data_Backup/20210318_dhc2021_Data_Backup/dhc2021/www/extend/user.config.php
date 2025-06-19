<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

include_once G5_PATH."/dhc/config.exam.php";

/*
if($is_http==1){
	;
}else{
	if(!isset($_SERVER["HTTPS"])) {
		header('Location: https://'.$_SERVER["HTTP_HOST"].$_SERVER['REQUEST_URI']);
	}
}
*/
$g5['week']=array("일", "월", "화", "수", "목", "금", "토");


function modal_form_head($id, $title, $msize="lg", $position="left"){?>
<!-- Modal -->
<div class="modal fade <?php echo $position;?> sidePage" id="<?php echo $id;?>Modal" tabindex="-1" role="dialog" aria-labelledby="<?php echo $id;?>ModalLabel" aria-hidden="true">
	<div class="modal-dialog  modal-dialog-aside modal-<?php echo $msize;?>" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true"><span class="icon icon-arrow-left"></span></span>
				</button>
				<h4 class="modal-title" id="<?php echo $id;?>ModalLabel"><?php echo $title;?></h4>
			</div>
			<div class="modal-body">
<?php 
}

function modal_form_tail(){?>
			</div><!-- body -->
		</div><!-- content -->
	</div><!-- dialog -->
</div>
<?php }

function simple_date($date){
	return str_replace("-",".",substr($date, 2,8));
}

//엔코딩을 정의한다
function rt_encode($data){
	//array => str
	$data = serialize($data);
	return base64_encode($data);
}
//디코딩을 정의한다
function rt_decode($data){
	if($data){
		//str => array
		$data = base64_decode($data);
		return unserialize($data);
	}
	return array();
}
function get_list_file($bo_table, $wr_id, $bf_no, $resize=0){
	global $g5;
    $sql = " select * from {$g5['board_file_table']} 
	where bo_table='{$bo_table}' 
	and wr_id='{$wr_id}' 
	and bf_no='{$bf_no}'";
    $row = sql_fetch($sql);
	if($row['bf_file']){
		if($resize){
			$filepath=G5_DATA_PATH.'/file/'.$bo_table;
			$tname = thumbnail($row['bf_file'], $filepath, $filepath, $resize , 0, false );
			return G5_DATA_URL.'/file/'.$bo_table."/".$tname; 
		}
		else{
			return G5_DATA_URL.'/file/'.$bo_table."/".$row['bf_file']; 
		}
	}
	return ""; 
}

function ajax_msg($msg){
	echo json_encode($msg, true); 
	exit();
}
?>