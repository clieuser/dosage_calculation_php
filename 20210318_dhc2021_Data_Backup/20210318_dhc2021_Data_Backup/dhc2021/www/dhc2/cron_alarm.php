<?php
$is_http = 1;
include_once('./_common.php');
include_once(G5_ADMIN_PATH.'/alio/_config.php');
include_once(G5_LIB_PATH.'/curl.lib.php');
include_once(G5_LIB_PATH.'/alio.lib.php');

$sql= "select * from {$g5['member_table']} where mb_id='admin'";
$row=sql_fetch($sql); 


$url = "https://kapi.kakao.com/v1/push/register"; 
	
$headers = [
	'Host: kapi.kakao.com',
	'Authorization: Authorization: KakaoAK 6079c2641fd28b25057640094152a4a5',
	'Content-Type: application/json; charset=UTF-8',
];

$data_merge=array('transactionId'=>$transactionId, 'memberId' => $mem['memberId'], "paymentDate" => $cm_date, "callAmount"=>$row['cm_price']);
	
$datas_encode=json_encode($data_merge);
$return=curlContents($url, "POST", $datas_encode, $headers); 

print_r($return);

exit();
?>