<?php 
if(!$member['mb_id']){
	goto_url( G5_BBS_URL.'/login.php?'.$qstr.'&amp;url='.urlencode($_SERVER['SCRIPT_NAME']));
}
?>