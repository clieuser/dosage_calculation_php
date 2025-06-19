<?php
if($is_like==1){ //찜목록
	if($is_app==1){
		$sql_common = " from lh_notice as a , lh_notice_mobile as b ";
		$sql_search=" WHERE a.lh_id=b.lh_id "; 
		//AND b.mb_uuid='{$mb_uuid}' "; 
		$sql_order = " order by b.nl_id desc ";
	}else{
		$sql_common = " from lh_notice as a , lh_notice_like as b ";
		$sql_search=" WHERE a.lh_id=b.lh_id 
		AND b.mb_id='{$member['mb_id']}' "; 
		$sql_order = " order by b.nl_id desc ";
	}
}
else if($is_my==1){ /*나의 목록*/
	$sql_common = " from lh_notice as a, lh_rent as b ";
	$sql_search .= " ".(($sql_search)?"AND":"WHERE")."  a.lh_id = b.lh_id ";
}
else if($is_sell_best==1){ /*나의 목록*/
	$sql_common = " from lh_notice as a, lh_rent as b ";
	$sql_search .= " ".(($sql_search)?"AND":"WHERE")."  a.lh_id = b.lh_id  AND a.lh_best=1 ";
	$sql_order = " group by a.lh_id order by a.lh_best_order ";
}
else{ //분양정보

	$sql_common = " from lh_notice as a ";
	$sql_search = "";
	$where=" WHERE "; 
	
	if($sellType==1){
		$sql_search .=" {$where} lh_best = '1' "; 
		$where = " AND ";
	}
	else if($sellType==2){
		$sql_search .=" {$where} lh_recom = '1' "; //미분양 
		$where = " AND ";
	}

	if($stx){
		$sql_search .=" {$where} PAN_NM like '%{$stx}%' "; 
		$where = " AND "; 
	}

	if($sarea){
		$sql_search .=" {$where} CNP_CD_NM = '{$sarea}' "; 
		$where = " AND "; 
	}

	if($sca){
		if($sca=="기타"){
			$sql_search .=" {$where} ( PAN_SS = '".$arioStatus[0]."' OR PAN_SS = '".$arioStatus[3]."' OR PAN_SS = '".$arioStatus[4]."' ) "; 
		}
		else{
			$sql_search .=" {$where} PAN_SS = '{$sca}' "; 
		}
		$where = " AND ";
	}

	if (!$sst) {
		$sst = "PAN_NT_ST_DT";
		$sod = "desc";
	}
	$sql_order = " order by {$sst} {$sod} ";
}


$sql = " select count(*) as cnt {$sql_common} {$sql_search} {$sql_order} ";
$row = sql_fetch($sql);
$total_count = $row['cnt'];


$rows = $config['cf_page_rows'];
$from_record = intval($from_record); 

$sql = " select * {$sql_common} 
{$sql_search} {$sql_order} 
limit {$from_record}, {$rows} ";
//echo $sql; 
$result = sql_query($sql);
$str="";
for ($i=0; $row=sql_fetch_array($result); $i++) {
	$str.="<li class='item' id='lh_id{$row['lh_id']}'>
	<div class='notice_icon'><span class='icon icon-volume-2'></span></div>
	<div class='notice_text'>
		
		<div class='cate'>
			<span class='type'>[".$row['UPP_AIS_TP_NM'];
		if( $row['UPP_AIS_TP_NM'] !=  $row['UPP_AIS_TP_NM']){
			$str.= $row['UPP_AIS_TP_NM']; 
		}
		$str.="]</span>
			<span class='area'>".$row['CNP_CD_NM']."
			</span>
		</div>
		<div class='subject'><button type='button' class='noticeDetail' data-val='".$row['lh_id']."'>".$row['PAN_NM']."</button></div>

		<div class='info'>
			<span class='status mr-2'>[".$row['PAN_SS']."]</span>
			<span class='area2'>".$row['CNP_CD_NM']."</span>
			<span class='endText ml-auto mr-2'>마감일</span>
			<span class='endText'>".substr($row['CLSG_DT'],2,8)."</span>
		</div>
	</div>
</li>"; 
}
?>