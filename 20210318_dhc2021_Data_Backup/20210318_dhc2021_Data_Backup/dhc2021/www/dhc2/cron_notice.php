<?php
$is_http = 1;
include_once('./_common.php');

include_once(G5_ADMIN_PATH.'/alio/_config.php');
include_once(G5_LIB_PATH.'/curl.lib.php');
include_once(G5_LIB_PATH.'/alio.lib.php');


$result=alio_notice_search();

$str = "등록 - 검색: {$result['total_cnt']}, 등록: {$result['insert_cnt']}, 수정: {$result['update_cnt']}, 최종번호: {$result['RNUM']} / 조회 - 검색: {$result['start_date']}";

//공고 조회 정의
$sql="insert into lh_log set 
ll_id='', 
ll_code='공고조회', 
ll_content='{$str}', 
ll_inputdate='".G5_TIME_YMDHIS."'";
sql_query($sql); 

//공급 조회 정의
if($result['insert_cnt'] || $result['update_cnt']){
	$cnt = alio_rent_search();
	if($cnt)
	{
		$sql="insert into lh_log set 
		ll_id='', 
		ll_code='공급조회', 
		ll_content='{$cnt}건을 수정 ', 
		ll_inputdate='".G5_TIME_YMDHIS."'";
		sql_query($sql); 
	}
}

//=====================================
$stype=array();
$sql="select UPP_AIS_TPCD, UPP_AIS_TP_NM from lh_notice
group by UPP_AIS_TPCD 
order by  UPP_AIS_TPCD";
$result=sql_query($sql); 
while($row=sql_fetch_array($result)){
	$stype[$row['UPP_AIS_TPCD']]=$row['UPP_AIS_TPNM']
}
$stypeStr = rt_encode($stype);

$sql= "update g5_config set 
lh_stype='{$styeStr}'";
sql_query($sql);
//=====================================
exit();
?>