<?php 
//================================
//개인 setting 을 정의
if($is_my==1 || $is_setting==1)
{
	$is_notice=$member['is_notice'];
	$sstatus=$member['sstatus'];
	$sarea=$member['sarea'];
	$stype=$member['stype'];
	$ssize=$member['ssize'];
	$sdeposit=$member['sdeposit'];
	$srent=$member['srent'];
}
//================================

//지도를 정의한다
$seStr="";
if($is_map==1 || $is_my==1)
{
	$seArray=array();
	//모바일에는 내용이 없습니다.
	if(!$is_app && $is_map==1)
	{
		if($sstatus){
			$seArray[]= "<li><span class='head'>상태</span><span class='text'>".$sstatus."</span></li>";
		}
		if($sarea){
			$seArray[]= "<li><span class='head'>지역</span><span class='text'>".$arioArea[$sarea]."</span></li>";
		}
		if($stype){
			$seArray[]= "<li><span class='head'>종류</span><span class='text'>".$arioType[$stype]."</span></li>";
		}
		if($ssize){
			$seArray[]= "<li><span class='head'>면적</span><span class='text'>".$arioSize[$ssize]."</span></li>";
		}
		if($sdeposit){	
			$seArray[]= "<li><span class='head'>임대보증금</span><span class='text'>".$ario_deposit_price[$sdeposit]."</span></li>";
		}
		if($sdeposit){	
			$seArray[]= "<li><span class='head'>월세</span><span class='text'>".$ario_rent_price[$srent]."</span></li>";
		}
		if(count($seArray)){
			$seStr=implode("", $seArray);
		}
	}
	else{/*is_my == 1*/
		//나의 맞춤 분양정보를 보여준다
		
		$seStr="<li>
			<span class='head'>알림</span>
			<span class='text'>".(($is_notice)?"등록":"미등록")."</span>
		</li>
		<li>
			<span class='head'>상태</span>
			<span class='text'>".(($sstatus)?$sstatus:"전체")."</span>
		</li>
		<li>
			<span class='head'>지역</span>
			<span class='text'>".(($sarea)?$arioArea[$sarea]:"전체")."</span>
		</li>
		<li>
			<span class='head'>분양종류</span>
			<span class='text'>".(($stype)?$arioType[$stype]:"전체")."</span>
		</li>
		<li>
			<span class='head'>면적</span>
			<span class='text'>".(($ssize)?$arioSize[$ssize]:"전체")."</span>
		</li>
		<li>
			<span class='head'>임대보증금</span>
			<span class='text'>".(($sdeposit)?$ario_deposit_price[$sdeposit]:"전체")."</span>
		</li>
		<li>
			<span class='head'>월세</span>
			<span class='text'>".(($srent)?$ario_rent_price[$srent]:" 전체")."</span>
		</li>";
	}
	//==========================================
	//맵을 정의합니다 
	//현재 위치를 구한다 
	/*
		1. 설정 주소
		2. 현재 위치
		3. 검색중 최초값 
	*/
	$search_sql = ""; 
	if($sstatus){
		$search_sql .= " AND a.PAN_SS='{$sstauts}' ";
	}
	if($sarea){
		$search_sql .= " AND a.CNP_CD_NM='".$sarea."' ";
	}
	if($stype){
		$search_sql .= " AND a.UPP_AIS_TP_CD = '".$stype."'";
	}
	if($ssize){
		$search_sql .= " AND b.ex_area > 0 ";
		$arioSizeArr=array( "" ," AND b.ex_area < 30 ", " AND ( b.ex_area >= 30 AND b.ex_area < 40 ) ", " AND ( b.ex_area >= 40 AND b.ex_area < 50 ) " , " AND ( b.ex_area >= 50 AND b.ex_area < 60 ) ", " AND ( b.ex_area >= 60 AND b.ex_area < 70 ) " , " AND ( b.ex_area >= 70 AND b.ex_area < 85 ) ", " AND b.ex_area >= 85  ");
		$search_sql .= $arioSizeArr[$ssize]; 
	}
	if($sdeposit){	
		
		$search_sql .= " AND b.se_price > 0 ";
		$sdepositArr=array( "" ," AND b.se_price < 10000000 ", " AND ( b.se_price >= 10000000 AND b.se_price <  20000000 ) " , " AND ( b.se_price >= 20000000 AND b.se_price <  30000000 ) ", " AND ( b.se_price >= 30000000 AND b.se_price < 40000000 ) ", " AND ( b.se_price >= 40000000 AND b.se_price < 60000000 ) ", " AND ( b.se_price >= 60000000 AND b.se_price <  80000000 ) ", " AND ( b.se_price >= 80000000 AND b.se_price <  110000000 ) ", " AND ( b.se_price >= 100000000 AND b.se_price <  150000000 ) ", " AND ( b.se_price >= 150000000 AND b.se_price <  200000000 ) ", " AND ( b.se_price >= 200000000 AND b.se_price <  300000000 ) ", " AND ( b.se_price >= 300000000 AND b.se_price <  400000000 ) ", " AND ( b.se_price >= 400000000 AND b.se_price <  500000000 ) ", " AND ( b.se_price >= 500000000 AND b.se_price <  600000000 ) ", " AND ( b.se_price >= 600000000 AND b.se_price <  800000000 ) ", " AND b.se_price >= 600000000 ");
		$search_sql .= $sdepositArr[$sdeposit]; 

	}
	if($srent){	
		$search_sql .= " AND b.rent_price > 0 ";
		$srentArr=array( "" ," AND b.rent_price < 100000 ", " AND ( b.rent_price >= 100000 AND b.rent_price <  200000 ) " , " AND ( b.rent_price >= 200000 AND b.rent_price <  300000 ) ", " AND ( b.rent_price >= 300000 AND b.rent_price < 400000 ) ", " AND ( b.rent_price >= 400000 AND b.rent_price < 500000 ) ", " AND ( b.rent_price >= 500000 AND b.rent_price <  700000 ) ",  " AND b.rent_price >= 700000 ");
		$search_sql .= $srentArr[$srent]; 
	}
}


//==========================================
//is_app 앱등록은 사용안함
if($is_app && $is_map==1)
{
	;//페스
}else{

	$actionUrl=$className="";
	if($is_map==1){
		$className="is_map";
		$actionUrl="./sell_map.php";
		$is_search=1;
	}else if($is_setting==1){
		$className="is_setting";
		$actionUrl="./ajax.alio.php";
		$is_search=1;
	}
	else if($is_my==1){
		$className="is_my";
		$is_search=0;
	}
	if($is_app==1){
		if($is_map==1){
			$actionUrl="./sell_map.php";
		}else if($is_setting==1){
			$actionUrl="return mySetUpdate()";
		}
	}
	?>
	<div id="mapHead" class="<?php echo $className;?>">
		<?php if($is_search==1){?>
			<?php if($is_map==1){?>
			<form name="fsearch" id="fsearch"  method="post" action="<?php echo $actionUrl;?>">
			<?php }else{?>
			<form name="fSetting" id="fSetting"  method="post" onsubmit="<?php echo $actionUrl;?>">
			<input type="hidden" name="mb_uuid" id="mb_uuid" value="">
			<?php }?>

		<ul class="sellSearch">
			<?php if($is_setting){?>
			<input type="hidden" name="wType" value="alarmSetting">
			<li style="padding-top:10px;padding-bottom:10px;">
				<div class="header">분양알림</div>
				<input type="radio" name="is_notice" id="is_notice0" value="1" <?php echo (($is_notice)?"checked":"");?> class="mr-1" style="width:25px;height:25px;">
				<label for="is_notice0" class="mr-3">사용</label>
				<input type="radio" name="is_notice" id="is_notice1" value="0" <?php echo (($is_notice)?"":"checked");?> class="mr-1" style="width:25px;height:25px;">
				<label for="is_notice1">미사용</label>
				</li>
			<?php }?>

			<li>
				<div class="header">상태</div>
				<select name="sstatus" class="form-control">
					<option value="" >상태</option>
					<?php 
					foreach($arioStatus as $value){
						echo "<option value='{$value}' ".(($sstatus==$value)?'selected':'').">".$value."</option>"; 
					}
				?>
				</select>
			</li>

			<li>
				<div class="header">지역</div>
				<select name="sarea" class="form-control">
					<option value="" >지역</option>
					<?php 
					foreach($arioArea as $key => $value){
						echo "<option value='{$value}' ".(($sarea==$value)?'selected':'').">".$value."</option>"; 
					}
				?>
				</select>
			</li>

			<li>
				<div class="header">종류</div>
				<select name='stype' class='form-control'>
					<option value='' >종류</option>
					<?php 
					foreach($arioType as $key => $value){
						echo "<option value='{$key}' ".(($stype==$key)?'selected':'').">".$value."</option>"; 
					}
					?>
				</select>
			</li>
			
			<li>
				<div class="header">면적</div>
				<select name='ssize' class='form-control'>
					
					<option value='' >면적</option>
					<?php 
					$counter = count($arioSize);
					for($i=1;$i<$counter;$i++){
						echo "<option value='".$i."' ".(($ssize==$i)?'selected':'').">".$arioSize[$i]."</option>"; 
					}
					?>
				</select>
			</li>

			<li>
				<div class="header">임대보증금</div>
				<select name='sdeposit' class='form-control'>
					<option value='' >임대보증금</option>
					<?php 
					$counter = count($ario_deposit_price);
					for($i=1;$i<$counter;$i++){
						echo "<option value='".$i."' ".(($sdeposit==$i)?'selected':'').">".$ario_deposit_price[$i]."</option>"; 
					}
					?>
				</select>
			</li>

			<li>
				<div class="header">월세</div>
				<select name='srent' class='form-control'>
					<option value='' >월세</option>
					<?php 
					$counter = count($ario_rent_price);
					for($i=1;$i<$counter;$i++){
						echo "<option value='".$i."' ".(($srent==$i)?'selected':'').">".$ario_rent_price[$i]."</option>"; 
					}
					?>
				</select>
			</li>
		</ul>
		<?php 
		} //END is search 
		//=================================
		?>

		<?php if($is_search==1){ /*맵, 분양설정 정의*/?>
			<?php if($is_setting){/*맵 정의*/?>
			<div class="submitCon my-3 text-center">
				<button type="submit" class="btn btn-info btn-lg">설정수정</button>
			</div>
			<?php }?>
		</form>
		<?php }?>

		<?php if($seStr){?>
		<div class="seStr"><?php echo $seStr;?></div>
		<?php }?>
	</div>
<?php }
//====================================

if(!$is_app && $is_map==1){ /*맵을 정의*/?>
<script type="text/javascript">
<!--
	jQuery(document).ready(function(){
		jQuery("#fsearch select").on("change", function(){
			jQuery("#fsearch").submit();
		});
	});
//-->
</script>
<?php }?>