<?php
$is_http = 1;
include_once('./_common.php');
include_once(G5_ADMIN_PATH.'/alio/_config.php');
include_once(G5_LIB_PATH.'/curl.lib.php');
include_once(G5_LIB_PATH.'/alio.lib.php');

$cnt = alio_rent_search();
if($cnt)
{
	$sql="insert into lh_log set 
	ll_id='', 
	ll_code='공급조회', 
	ll_content='{$cnt}건을 수정 ', 
	ll_inputdate='".G5_TIME_YMDHIS."'";
	sql_query($sql); 
	echo $sql; 
	echo "<br>";
}


$sql = "select * from lh_rent 
where address_detail <> '' 
AND rt_map='0'
AND rt_map_error='0' ";
$result=sql_query($sql); 
while($row=sql_fetch_array($result))
{
	echo $row['address_detail']; 
	echo "<br>";
	if(mb_strlen($row['address_detail'])<10){
		$sql = "update lh_rent set 
		rt_map_error='1'
		where rt_id='{$row['rt_id']}'"; 
		sql_query($sql); 
		echo $sql; 
		echo "<br>";		
		continue; 
	}
	$url = "https://dapi.kakao.com/v2/local/search/address.json"; 
	
	$headers = [
		'Host: dapi.kakao.com',
		'Authorization: KakaoAK 6079c2641fd28b25057640094152a4a5',
		'Content-Type: application/json; charset=UTF-8',
	];
	$data_merge=array('query'=>$row['address_detail']);
	//$datas_encode=json_encode($data_merge);
	
	$return=curlContents($url, "GET", $data_merge, $headers); 
	if($result!="")
	{
		$rt_lat=$return['documents'][0]['y'];
		$rt_lang=$return['documents'][0]['x'];
		
		if($rt_lat && $rt_lang)
		{
			$sql = "update lh_rent set 
			rt_lat='{$rt_lat}', 
			rt_lang='{$rt_lang}', 
			rt_map='1'
			where rt_id='{$row['rt_id']}'"; 
			sql_query($sql); 
			echo $sql;
			echo "<br>";		
		}
	}
}
exit();
?>