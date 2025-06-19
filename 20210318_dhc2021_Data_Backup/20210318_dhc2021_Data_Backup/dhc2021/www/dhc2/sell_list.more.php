<?php 
if($total_count > $config['cf_page_rows']){?>
<div class="moreCon">
	<button type="button" name="btn btn-success" id="btn-more" data-val="<?php echo $total_count;?>">더보기</button>
</div>
<div class="loader"></div>


<!-- 추가 검색을 정의한다 -->
<form name="fmore" id="fmore"  method="post" onsubmit="return false">
<input type="hidden" name="wType" value="sell_list">
<input type="hidden" name="is_like" value="<?php echo $is_like;?>">
<input type="hidden" name="sarea" value="<?php echo $sarea;?>">
<input type="hidden" name="total_count" value="<?php echo $total_count;?>">
<input type="hidden" name="from_record" value="">
<input type="hidden" name="sca" value="<?php echo $sca;?>">
<input type="hidden" name="stx" value="<?php echo $stx;?>">
</form>
<!-- END 추가 검색을 정의한다 -->

<script>
	jQuery(document).ready(function(){
		//==================================
		//더보기를 정의한다.
		jQuery("#btn-more").on("click",function(){
			jQuery(this).prop("disabled",true); //더보기 클릭금지
			jQuery(".loader").addClass("on");
			var total_count = jQuery("#fmore input[name='total_count']").val(); //전체수량
			var from_record = jQuery("#dataList li.item").length; //보이는 수량
			jQuery("#fmore input[name='from_record']").val(from_record); //보이는 수량저장
			datas=jQuery("#fmore").serialize();
			$.ajax({
				type: "POST",
				url: "./ajax.alio.php",
				data:datas ,
				success: function(data) {
					jQuery("#dataList").append(data);//내용등록
					from_record = jQuery("#dataList li.item").length; //수량확인
					jQuery(".loader").removeClass("on");
					jQuery("#btn-more").prop("disabled", false); //더보기 클릭 가능
					if(total_count<=from_record){
						jQuery(".moreCon").remove();					 
					}

				}
			});		
			return false;
		});
	});
</script>
<?php }?>