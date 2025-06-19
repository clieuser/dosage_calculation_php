<?php
if($is_app==1){
	$sql = "select count(*) as cnt 
	from lh_notice_mobile
	where mb_uuid = '{$mb_uuid}'
	AND lh_id='{$lh_id}'";
}else{
	$sql = "select count(*) as cnt 
	from lh_notice_like
	where mb_id = '{$member['mb_id']}'
	AND lh_id='{$lh_id}'";
}
$krow=sql_fetch($sql); 

$str="<div id='noticeBox'>
<div class='noticeCon'>
	<div class='noticeHead'>
		<span class='icon icon-volume-2 mr-1'></span>
		<span class='type mr-1'>[".$notice['UPP_AIS_TP_NM'];
		$temp_str="";
		if( $notice['UPP_AIS_TP_NM'] !=  $notice['UPP_AIS_TP_NM']){
			$temp_str= " ".$notice['UPP_AIS_TP_NM']; 
		}
		$str.= $temp_str."]</span>
		<span class='area mr-1'>".$notice['CNP_CD_NM']."</span>

		<div class='ml-auto notice_like_con'>
		<input type='checkbox' name='notice_like' value='".$lh_id."' id='notice_like' ".(($krow['cnt'])?"checked":"").">
		<label for='notice_like'>
			<i class='fa fa-heart' aria-hidden='true'></i>
			<i class='fa fa-heart-o' aria-hidden='true'></i>
		</label>
		</div>
	</div>

	<div class='noticeBody'>".$notice['PAN_NM']."</div>
	
	<table class='noticeInfo'>
	<tr>
		<td class='head head1'>상태</td>
		<td class='text text1'>".$notice['PAN_SS']."</td>
		<td class='head head2'>지역</td>
		<td class='text text2'>".$notice['CNP_CD_NM']."</td>
	</tr>
	<tr>
		<td class='head'>유형</td>
		<td>".$temp_str."</td>
		<td class='head'>공급기관</td>
		<td>LH한국주태공사</td>
	</tr>
	<tr>
		<td class='head'>공고일</td>
		<td>".substr($notice['PAN_NT_ST_DT'],2,8)."</td>
		<td class='head'>공고마감</td>
		<td>".substr($notice['CLSG_DT'],2,8)."</td>
	</tr>
	</table>
</div>"; 

if($is_app){
	$str.="<div class='my-1 detail_banner text-center'><a href='./sell_list.htm?sarea=".urlencode($notice['CNP_CD_NM'])."'><img src='./img/more_sell.png'></a></div>";
}else{
	$str.="<div class='my-1 detail_banner'><a href='/alio/sell_list.php?sarea=".urlencode($notice['CNP_CD_NM'])."'><img src='/images/more_sell.png'></a></div>";
}

$listStr="";
$sql = " select * from lh_rent 
WHERE lh_id = '{$lh_id}'
order by rt_id desc "; 
$result=sql_query($sql);
while($row=sql_fetch_array($result)){
	$listStr.="<li class='rent_item'>"; 
	
	if($notice['SPL_INF_TP_CD']=="050" ||$notice['SPL_INF_TP_CD']=="060"){
		//분양주택(SPL_INF_TP_CD=050), 공공임대(5년, 10년, 분납임대) (SPL_INF_TP_CD=060)
		$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['rt_build']."]</span> ".$row['rt_name']."
		</div>
		<ul class='info_list'>
			<li>
				<span class='header'>공급면적</span>
				<span class='texter'>".$row['rt_area']."m<sup>2</sup></span>
			</li>
			<li>
				<span class='header'>전용면적</span>
				<span class='texter'>".$row['ex_area']."m<sup>2</sup></span>
			</li>
			<li>
				<span class='header'>세대수</span>
				<span class='texter'>".$row['total_cnt']."</span>
			</li>
			<li>
				<span class='header'>금회공급세대수</span>
				<span class='texter'>".$row['now_cnt']."</span>
			</li>"; 
		if($row['lh_type']=="dsList01"){
			$listStr.="<li>
			<span class='header'>평균분양가격(원)</span>
			<span class='texter'>".number_format($row['sales_price_avg'])."원</span>
		</li>"; 
		}else 	if($row['lh_type']=="dsList02"){
			$listStr.="<li>
			<span class='header'>임대보증금(원)</span>
			<span class='texter'>".number_format($row['se_price'])."원</span>
		</li>
		<li>
			<span class='header'>월임대료(원)</span>
			<span class='texter'>".number_format($row['rent_price'])."원</span>
		</li>"; 
		}
		$listStr.="</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="051"){
		//분양주택-분양전환(SPL_INF_TP_CD=051)
		$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['rt_build']."]</span> ".$row['rt_name']."
		</div>
		<ul class='info_list'>
			<li>
				<span class='header'>공급면적</span>
				<span class='texter'>".$row['rt_area']."m<sup>2</sup></span>
			</li>
			<li>
				<span class='header'>전용면적</span>
				<span class='texter'>".$row['ex_area']."m<sup>2</sup></span>
			</li>

			<li>
				<span class='header'>세대수</span>
				<span class='texter'>".$row['total_cnt']."</span>
			</li>
			<li>
				<span class='header'>금회공급세대수</span>
				<span class='texter'>".$row['now_cnt']."</span>
			</li>
			<li>
				<span class='header'>평균분양가격(원)</span>
				<span class='texter'>".number_format($row['sales_price_avg'])."원</span>
			</li>
		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="390"){
		//신혼희망타운(SPL_INF_TP_CD=390)
		$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['rt_build']."]</span> ".$row['rt_name']."
		</div>
		<ul class='info_list'>
			<li>
				<span class='header'>공급면적</span>
				<span class='texter'>".$row['rt_area']."m<sup>2</sup></span>
			</li>
			<li>
				<span class='header'>전용면적</span>
				<span class='texter'>".$row['ex_area']."m<sup>2</sup></span>
			</li>

			<li>
				<span class='header'>세대수</span>
				<span class='texter'>".$row['total_cnt']."</span>
			</li>
			<li>
				<span class='header'>금회공급세대수</span>
				<span class='texter'>".$row['now_cnt']."</span>
			</li>
			<li>
				<span class='header'>평균분양가격(원)</span>
				<span class='texter'>".number_format($row['sales_price_avg'])."원</span>
			</li>
		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="061" || $notice['SPL_INF_TP_CD']=="062" || $notice['SPL_INF_TP_CD']=="063" || ( $notice['SPL_INF_TP_CD']=="064" && $notice['CCR_CNNT_SYS_DS_CD']=="03") )
	{
		$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['rt_build']."]</span> ".$row['rt_name']."
		</div>
		<ul class='info_list'>
			<li>
				<span class='header'>공급면적</span>
				<span class='texter'>".$row['rt_area']."m<sup>2</sup></span>
			</li>
			<li>
				<span class='header'>전용면적</span>
				<span class='texter'>".$row['ex_area']."m<sup>2</sup></span>
			</li>

			<li>
				<span class='header'>세대수</span>
				<span class='texter'>".$row['total_cnt']."</span>
			</li>
			<li>
				<span class='header'>금회공급세대수</span>
				<span class='texter'>".$row['now_cnt']."</span>
			</li>
			<li>
				<span class='header'>임대보증금(원)</span>
				<span class='texter'>".$row['se_price']."원</span>
			</li>
			<li>
				<span class='header'>월임대료(원)</span>
				<span class='texter'>".$row['rent_price']."원</span>
			</li>
		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="130")
	{
		//청년신혼부부매입임대리츠(SPL_INF_TP_CD=130)
		$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['rt_build']."]</span> ".$row['address']."
		</div>
		<div class='rt_addr'>".$row['rt_name']."</div>

		<ul class='info_list'>
			<li>
				<span class='header'>공급호수</span>
				<span class='texter'>".$row['supply_cnt']."</span>
			</li>
			<li>
				<span class='header'>예비자수</span>
				<span class='texter'>".$row['spare_cnt']."</span>
			</li>
			<li>
				<span class='header'>당첨자수</span>
				<span class='texter'>".$row['win_cnt']."</span>
			</li>

		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="131")
	{
		//청년매입임대(SPL_INF_TP_CD=131)
		if($row['lh_type']=="dsList01"){
			$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['rt_build']."]</span> ".$row['rt_name']."
			</div>
			<div class='rt_area'>".$row['address']."</div>
			<ul class='info_list'>
			<li>
				<span class='header'>공급호수</span>
				<span class='texter'>".$row['supply_cnt']."</span>
			</li>
			<li>
				<span class='header'>모집인원</span>
				<span class='texter'>".$row['recruit_cnt']."</span>
			</li>
			</ul>";
		}else if($row['lh_type']=="dsList02"){
			$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['rt_address']."]</span> ".$row['rt_name']."
			</div>
			<div class='rt_area'>".$row['address']."</div>
			<ul class='info_list'>
			<li>
				<span class='header'>공급호수</span>
				<span class='texter'>".$row['supply_cnt']."</span>
			</li>
			<li>
				<span class='header'>모집인원</span>
				<span class='texter'>".$row['recruit_cnt']."</span>
			</li>
			<li>
				<span class='header'>기타</span>
				<span class='texter'>".$row['private_type']."</span>
			</li>
			</ul>";
		}
	}
	else if($notice['SPL_INF_TP_CD']=="132")
	{
		//신혼부부매입임대(SPL_INF_TP_CD=132)
		$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['rt_address']."]</span> ".$row['rt_name']."
		</div>
		<ul class='info_list'>
		<li>
			<span class='header'>공급호수</span>
			<span class='texter'>".$row['supply_cnt']."</span>
		</li>
		<li>
			<span class='header'>모집인원</span>
			<span class='texter'>".$row['recruit_cnt']."</span>
		</li>
		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="133")
	{
		//집주인리모델링(SPL_INF_TP_CD=133)
		$listStr.="<div class='rt_name'>".$row['rt_name']."</div>
		<ul class='info_list'>
		<li>
			<span class='header'>모집인원</span>
			<span class='texter'>".$row['recruit_cnt']."</span>
		</li>
		</ul>";
	}

	else if($notice['SPL_INF_TP_CD']=="134")
	{
		//기숙사형매입임대(SPL_INF_TP_CD=134)
		$listStr.="<div class='rt_name'>".$row['rt_name']."</div>
		<ul class='info_list'>
		<li>
			<span class='header'>공급호수</span>
			<span class='texter'>".$row['supply_cnt']."</span>
		</li>
		<li>
			<span class='header'>모집인원</span>
			<span class='texter'>".$row['recruit_cnt']."</span>
		</li>
		<li>
				<span class='header'>기타</span>
				<span class='texter'>".$row['private_type']."</span>
			</li>
		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="135")
	{
		//다가구매입임대(SPL_INF_TP_CD=135)
		$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['rt_build']."]</span> ".$row['rt_name']."
		</div>
		<ul class='info_list'>
		<li>
			<span class='header'>모집인원</span>
			<span class='texter'>".$row['recruit_cnt']."</span>
		</li>
		<li>
			<span class='header'>가구원수</span>
			<span class='texter'>".$row['private_type']."</span>
		</li>
		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="136")
	{
		//매입임대-장기미임대(SPL_INF_TP_CD=136)
		$listStr.="<div class='rt_name'>".$row['address_detail']."</div>
		<ul class='info_list'>

		<li>
			<span class='header'>전용면적</span>
			<span class='texter'>".$row['ex_area']."m<sup>2</sup></span>
		</li>
		<li>
			<span class='header'>호 / 층수</span>
			<span class='texter'>".$row['address_ho']." / ".$row['address_floor']."</span>
		</li>
		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="137")
	{
		//매입임대-장기미임대(SPL_INF_TP_CD=136)
		$listStr.="<div class='rt_name'>
			<span class='rt_build'>[".$row['address']."]</span> ".$row['rt_name']."
		</div>
		<ul class='info_list'>
		<li>
			<span class='header'>학생분류</span>
			<span class='texter'>".$row['private_type']."</span>
		</li>
		<li>
			<span class='header'>총공급물량</span>
			<span class='texter'>".$row['supply_cnt']."</span>
		</li>
		<li>
			<span class='header'>청년공급물량</span>
			<span class='texter'>".$row['st_young_cnt']."</span>
		</li>
		<li>
			<span class='header'>대학생공급물량</span>
			<span class='texter'>".$row['st_univ_cnt']."</span>
		</li>
		<li>
			<span class='header'>취업준비생공급물량</span>
			<span class='texter'>".$row['st_work_cnt']."</span>
		</li>
		<li>
			<span class='header'>공동거주공급물량</span>
			<span class='texter'>".$row['st_com_cnt']."</span>
		</li>

		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="138")
	{
		//신혼부부전세임대(SPL_INF_TP_CD=138)
		$listStr.="<div class='rt_name'>[".$row['private_type']."]".$row['rt_name']."</div>
		<ul class='info_list'>
		<li>
			<span class='header'>총공급물량</span>
			<span class='texter'>".$row['supply_cnt']."</span>
		</li>
		</ul>";
	}
	else if($notice['SPL_INF_TP_CD']=="138")
	{
		//기존주택전세임대(SPL_INF_TP_CD=139)
		$listStr.="<div class='rt_name'>".$row['rt_name']."</div>
		<ul class='info_list'>
		<li>
			<span class='header'>공급호수</span>
			<span class='texter'>".$row['supply_cnt']."</span>
		</li>
		</ul>";
	}
	$listStr.="</li>"; 
}

$str.="<div class='rentTitle'>공급정보</div>
<ul class='rentList'>{$listStr}</ul>
</div>"; 
?>