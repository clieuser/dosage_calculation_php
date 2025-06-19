<?php 
$wr_5=rt_encode($varCon); 
$wr_6=rt_encode($answerCon); 
$wr_10=rt_encode($unitCon); 

$sql = "update {$write_table} set
wr_5='".$wr_5."',
wr_6='".$wr_6."',
wr_10='".$wr_10."',
wr_good='{$wr_good}'
where wr_id='{$wr_id}'";
sql_query($sql);
?>