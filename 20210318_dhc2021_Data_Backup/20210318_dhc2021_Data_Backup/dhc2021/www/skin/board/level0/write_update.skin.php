<?php 
$sql = "update {$write_table} set
wr_good='{$wr_good}'
where wr_id='{$wr_id}'";
sql_query($sql);
?>