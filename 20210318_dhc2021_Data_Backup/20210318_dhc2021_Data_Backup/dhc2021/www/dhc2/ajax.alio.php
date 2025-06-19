<?php
include_once('./_common.php');

if($wType=="sell_list"){
	include_once "./sell_list.sub.php";
	echo $str;
	exit();
}
else if($wType=="sell_map"){
	//include_once "./sell_.sub.php";
	echo $str;
	exit();
}
else if($wType=="sell_detail"){
	//$lh_id=326;
	$sql= "select * from lh_notice where lh_id='{$lh_id}'";
	$notice=sql_fetch($sql);
	if( !$notice['lh_id']){
		echo ""; 
		exit();
	}
	include_once "./sell_list.detail.php";
	echo $str;
	exit();
}
else if($wType=="sell_heart"){
	if(!$member['mb_id']){
		echo "회원만 가능한 메뉴입니다.<br>로그인후 이용해주세요";	
		exit();
	}
	if($lh_id){
		if($heart){//등록
			$sql = "insert into lh_notice_like set 
			nl_id='', 
			lh_id='{$lh_id}', 
			mb_id='{$member['mb_id']}', 
			nl_inputdate='".G5_TIME_YMDHIS."'"; 
			sql_query($sql); 
		}else{
			$sql = "delete from lh_notice_like
			where lh_id='{$lh_id}'
			AND mb_id='{$member['mb_id']}'"; 
			sql_query($sql); 	
		}
		echo "ok"; exit();
	}
}
else if($wType=="alarmSetting"){
	//분양 알림을 셋팅한다 form  정의 
	if(!$member['mb_id']){
		alert2("회원만 가능한 메뉴입니다.<br>로그인후 이용해주세요");	
		exit();
	}

	$sql = "update {$g5['member_table']} set 
	is_notice='{$is_notice}',
	sstatus='{$sstatus}',
	sarea='{$sarea}',
	stype='{$stype}',
	ssize='{$ssize}',
	sdeposit='{$sdeposit}',
	srent='{$srent}'
	where mb_id='{$member['mb_id']}'"; 
	sql_query($sql); 
	goto_url("./mySet.php");
}
else if($wType=="uuid"){
	if($member['mb_id'] && $my_uuid){
		$sql="update {$g5['member_table']} set
		my_uuid='{$my_uuid}'
		where mb_id='{$member['mb_id']}'";
		sql_query($sql); 
	}
}
else if($wType=="location"){
	if($my_lat && $my_long){
		set_session("ss_my_lat",$my_lat);
		set_session("ss_my_long",$my_long);
	
		if($member['mb_id'] ){
			$sql="update {$g5['member_table']} set
			my_lat='{$my_lat}', 
			my_long='{$my_long}' 
			where mb_id='{$member['mb_id']}'";
			sql_query($sql); 
		}
	}	
	echo $my_lat;
}
?>