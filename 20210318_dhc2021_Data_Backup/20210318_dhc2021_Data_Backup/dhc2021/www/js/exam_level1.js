$( document ).ready(function() {
	//카운터 세팅
	$('.timer').countimer({
		autoStart : false
	});

	//트레이닝 연속
	jQuery("#examStart").on("click", "button", function(){
		level1_loading(0);
	});

	//트레이닝 다시연습
	jQuery("#examRepeat").on("click", "button", function(){
		level1_loading(1);
	});

	level1_loading(0);
});

function hint_view1(){
	if(jQuery("#examQ").hasClass("hint1")){
		jQuery("#examQ").removeClass("hint1 hint2");	
	}else{
		jQuery("#examQ").addClass("hint1");
	}
}
function hint_view2(){
	if(jQuery("#examQ").hasClass("hint2")){		
		jQuery("#examQ").removeClass("hint1 hint2");
	}
	else{
		jQuery("#examQ").addClass("hint1 hint2");	

	}
}



//시험시작, 이어서하기, 처음부터하기
function level1_loading(examRepeat){
	var cate=jQuery("#cateNum").val();
	$.ajax({
		type: "POST",
		url: "./ajax.dhc.php",
		data:{"wType":"level1_load","examRepeat":examRepeat,"cate":cate} ,
		dataType: 'json',
		success: function(data) {
			if(data[0]==1){
				jQuery("#examQ").html(data[1]).addClass("active");
				jQuery("#examR").html("").removeClass("active");
				jQuery("#examCon").removeClass("init stop").addClass("start");
				MathJax.typesetPromise($("#hintDetail"));
				$('.timer').countimer("start");

			}else{
				alert(data[1]);
			}
		}
	});	
}

//채점을 정의한다.
function level1Submit(){
	var error=0;
	var pattern = /(^[0-9\.\,]+$)/;
	jQuery("#formLevel1 .exam_answer").each(function(){
		var value= jQuery(this).val(); 
		if (!pattern.test(value)) {
			error++;
		}	
	});
	if(error>0){
		alert(error+"입력은 숫자, 소수점(,), 컴마(,)만 가능합니다.");
		return false;
	}
	var datas=jQuery("#formLevel1").serialize();
	$('.timer').countimer("stop");
	$.ajax({
		type: "POST",		
		url:"./ajax.dhc.php",
		data:datas ,
		dataType: 'json',
		success: function(data){
			if(data[0]==1){ 
				//결과가 있다면
				//ajax_msg(array(1, $result, $str, $per, $is_end, $is_complete));	
				var result=data[1];
				var result_str=data[2];
				var per=data[3];
				var is_end=data[4];
				//정답 오답을 체크한다.
				for(var i=0;i<result.length;i++){
					if(result[i]==1){//정답
						jQuery("#examQ .examTr.exam"+i+ " .ex1_answer").addClass("examTrue");
					}else{
						jQuery("#examQ .examTr.exam"+i+ " .ex1_answer").addClass("examFalse");					
					}
				}
				//내용을 보여준다
				jQuery("#examCon").removeClass("start").addClass("stop");
				prgressBarChange(per);
				
				jQuery("#examR").html(result_str); //result, basic, string 
				jQuery("#examR").addClass("active"); //결과를 보여준다
				$("#hintDetail").remove();
				jQuery("#examQ input.exam_answer").prop("readonly",true);
				jQuery("#examQ .level1Submit").css("display","none");
				MathJax.typesetPromise($("#level1Result"));
				return false;									
			}
			else{
				alert(data[1]);		
			}
		}
	});	
	return false;
}