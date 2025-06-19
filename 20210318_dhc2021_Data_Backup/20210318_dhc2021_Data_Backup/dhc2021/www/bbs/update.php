<?php
include_once('./_common.php');

if(!$is_admin){
	alert("접근하실수 없습니다.");
}
if(!$bo_table){
	alert("접근하실수 없습니다.");	
}
if($bo_table =="level0"  )
{
	$counter=count($update_wr_id);

	for($i=0;$i<$counter;$i++)
	{
		$temp_wr_id=$update_wr_id[$i];
		$sql = "update $write_table set
		ca_name='".$ca_name[$i]."',
		wr_subject='".trim($wr_subject[$i])."',
		wr_content='".trim($wr_content[$i])."',
		wr_1='".$wr_1[$i]."',
		wr_2='".trim($wr_2[$i])."',
		wr_3='".intval($wr_3[$i])."',
		wr_4='".intval($wr_4[$i])."',
		wr_5='".intval($wr_5[$i])."',
		wr_6='".intval($wr_6[$i])."',
		wr_good='".intval($wr_good[$i])."'
		where wr_id='".$update_wr_id[$i]."'";
		sql_query($sql);
	}
}
else if($bo_table =="level1" )
{
	$counter=count($update_wr_id);

	for($i=0;$i<$counter;$i++)
	{
		$temp_wr_id=$update_wr_id[$i];
		$sql = "update $write_table set
		wr_good='".$wr_good[$i]."'
		where wr_id='".$update_wr_id[$i]."'";
		sql_query($sql);
	}
}
goto_url(G5_HTTP_BBS_URL.'/board.php?bo_table='.$bo_table.'&page='.$page);
?>
