<?php 
modal_form_head("detailView", "공지상세보기", "xl"); 
?>

<?php 
modal_form_tail();
?>

<script type="text/javascript">
<!--
	var lh_id="";

	jQuery(document).ready(function(){
		jQuery("#detailViewModal").on("click touchstart", "#notice_like", function(){
			var heart=jQuery("#detailViewModal #notice_like").prop("checked")?1:0;
			var temp_lh_id=jQuery("#detailViewModal #notice_like").val();
			$.ajax({
				type: "POST",
				url: "./ajax.alio.php",
				data:{"wType":"sell_heart", "heart":heart, "lh_id":temp_lh_id} ,
				success: function(data) {
					if(data!="ok"){
						alertPop2("", data);
						jQuery("#detailViewModal #notice_like").prop("checked", (heart)?0:1);
						return false;
					}
				}
			});	
		});	

		jQuery("#dataList").on("click", ".noticeDetail", function(){
			lh_id=jQuery(this).data("val");
			detailViewShow(lh_id);
		}); 
	
		jQuery("#detailViewModal").on('hidden.bs.modal', function (e) {
			<?php if($is_like==1){?>
			var heart=jQuery("#detailViewModal #notice_like").prop("checked")?1:0;
			if(heart==0){jQuery("#lh_id"+lh_id).remove();}
			<?php }?>
			if($("#lh_id"+lh_id).length)
			{
				var offset = $("#lh_id"+lh_id).offset();
				$('html, body').animate({scrollTop : offset.top}, 200);
			}
		});	

	});
	
	function detailViewShow(lh_id){
		$.ajax({
				type: "POST",
				url: "./ajax.alio.php",
				data:{"wType":"sell_detail", "lh_id":lh_id} ,
				success: function(data) {
					if(data==""){
						alertPop2("","등록된내용이 없습니다.");
						return false;
					}
					jQuery("#detailViewModal .modal-body").html(data);//내용등록
					jQuery("#detailViewModal").modal("show");
				}
			});	
	}

//-->
</script>
