<?php
include_once('./_common.php');
$is_page=1;
$pageTitle="지도보기";
$is_map=1;
include_once(G5_PATH.'/head.php');

$is_map=1;

include_once "./sell_list.query.php";

//내용을 정의한다
$my_lat=$my_lang="";
if(!$sarea ){
	if($member['my_lat'] && $member['my_lang']){
		$my_lat=$member['my_lat'];
		$my_lang=$member['my_lang'];	
	}else{
		$my_lat=get_session("ss_my_lat");
		$my_long=get_session("ss_my_long");
	}
}

//echo "$my_lat , $my_long ddd";

$search_sql="";
$mapList=array(); 
$sql = "select * 
from lh_notice as a, lh_rent as b 
where a.lh_id=b.lh_id
AND rt_map='1' 
{$search_sql}
limit 1";
$row=sql_fetch($sql);
$mapStr="";
if($row['rt_id']){
	$map_first=$row;
	if($row['rt_name']){
		$rt_name=$row['rt_name'];
	}else{
		$rt_name=$row['rt_build'];
	}
	
	if($my_lat && $my_lang){
		; 
	}else{
		$my_lat=$row['rt_lat'];
		$my_lang=$row['rt_lang'];
	}
	
	$mapList[]="{ lh_id:'".$row['lh_id']."', title: '".$rt_name."', content:'".$rt_name."' , latlng: new kakao.maps.LatLng({$row['rt_lat']}, {$row['rt_lang']}) , rt_lat:'".$row['rt_lat']."', rt_lang:'".$row['rt_lang']."'}";

	$sql = "select * , 
	(6371*acos(cos(radians({$my_lat}))*cos(radians(rt_lat))*cos(radians({$my_lang})  - radians(rt_lang))+sin(radians({$my_lat}))*sin(radians(rt_lat)))) AS distance
	from lh_rent
	where rt_map='1' 
	group by address_detail
	HAVING distance <= 50
	order by distance desc";
	$result=sql_query($sql); 

	//echo $sql;

	while($row=sql_fetch_array($result)){
		if($row['rt_name']){
			$rt_name=$row['rt_name'];
		}else{
			$rt_name=$row['rt_build'];
		}
		$mapList[]="{ lh_id:'".$row['lh_id']."', title: '".$rt_name."', content:'<div>".$rt_name."</div>' , latlng: new kakao.maps.LatLng({$row['rt_lat']}, {$row['rt_lang']}) }";
	}	
}
if(count($mapList)){
	$mapStr=implode(",",$mapList);
}
//==========================================
?>
<!-- 지도 -->
<div id="map"></div>

<script type="text/javascript">
<!--
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
			center: new kakao.maps.LatLng(<?php echo $map_first['rt_lat'];?>, <?php echo $map_first['rt_lang'];?>), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [<?php echo $mapStr;?> ];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	var start=0;
	for (var i = 0; i < positions.length; i ++) {
		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24, 35); 
		
		// 마커 이미지를 생성합니다    
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions[i].latlng , // 마커의 위치
			image : markerImage , // 마커 이미지 
			title:positions[i].lh_id
		});
	
		// 마커에 표시할 인포윈도우를 생성합니다 
		var infowindow = new kakao.maps.InfoWindow({
			content: "<div style='width:250px;padding:5px;text-align:center;'>"+positions[i].content+"</div>" // 인포윈도우에 표시할 내용
		});

		infowindow.open(map, marker); 
		var lh_id=positions[i].lh_id;
		kakao.maps.event.addListener( marker, 'click', function (){
			detailViewShow(marker.getTitle());
		});
		//markers.push(marker);
		//kakao.maps.event.trigger(marker, 'click','');
	}

	map.panTo(new kakao.maps.LatLng(<?php echo $map_first['rt_lat'];?>, <?php echo $map_first['rt_lang'];?>)); 

//-->
</script>


<?php
include_once "./sell_detail.php";
?>

<?php
include_once(G5_PATH.'/tail.php');
?>