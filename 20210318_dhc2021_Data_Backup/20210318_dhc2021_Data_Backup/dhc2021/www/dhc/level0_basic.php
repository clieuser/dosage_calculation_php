<?php
include_once('./_common.php');
include_once "./_member_check.php"; 

$pageTitle=LEVEL0_NAMES." 기초정보";
include_once(G5_PATH.'/head.php');

$nav_id=0;
include_once "./level0_head.php";
?>

<!-- ************************
// 내용을 등록해 주세요 
************************-->
<?
$sql = "select * from g5_write_level0
where ca_name='사용'
order by wr_good ";
$result=sql_query($sql); 
while($row=sql_fetch_array($result)){
	$wr_subject = explode(",",$row['wr_subject']);
	$wr_content = str_replace("|" , "&nbsp;=&gt;&nbsp;" ,$row['wr_content']);
	$str.= "<tr>
	<td class='header'>{$row['wr_1']}</td>
	<td>{$wr_subject[0]}</td>
	<td>{$wr_subject[1]}</td>
	<td class='text-left'>{$wr_content}</td>
</tr>";
}
?>

<table class="table_list table_basic">
<tr class="head">
	<td style="width:15%;">타입</td>
	<td style="width:20%;">단위</td>
	<td style="width:20%;">단위2</td>
	<td style="width:45%;">변환</td>
</tr>
<?php echo $str;?>
</table>


<!-- ************************
// END 내용을 등록해 주세요 
************************-->



<?php
include_once(G5_PATH.'/tail.php');
?>