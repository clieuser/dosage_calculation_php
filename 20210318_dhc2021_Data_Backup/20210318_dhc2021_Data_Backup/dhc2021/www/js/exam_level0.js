$( document ).ready(function() {
	//카운터 세팅
	var is_auto_start=jQuery(".timer").hasClass("autoStart");
	$('.timer').countimer({
		autoStart : is_auto_start
	});

	//트레이닝 이어서 시작
	jQuery("#examStart button").on("click", function(){
		level0_loading(0);
	});

	//트레이닝 처음부터시작
	jQuery("#examRestart button").on("click", function(){
		level0_loading(1);
	});

});

function goto_level0_test(){
	location.href="./level0_test.php";
}

//시험시작, 이어서하기, 처음부터하기
function level0_loading(is_start){
	$.ajax({
		type: "POST",
		url: "./ajax.dhc.php",
		data:{"wType":"level0_load","is_start":is_start} ,
		dataType: 'json',
		success: function(data) {
			//alert(data);
			if(data[0]==1){
				jQuery("#examQ").html(data[1]).addClass("active");
				jQuery("#examR").html("").removeClass("active");
				jQuery("#examB").removeClass("active");
				jQuery("#examT").removeClass("active");
				jQuery("#examCon").removeClass("init stop").addClass("start");
				$('.timer').countimer("start");
			}else{
				alert(data[1]);
			}
		}
	});	
}

//채점을 정의한다.
function level0Submit(){
	var error=0;
	var pattern = /(^[0-9\.\,]+$)/;
	jQuery("#formLevel0 .exam_answer").each(function(){
		var value= jQuery(this).val(); 
		if (!pattern.test(value)) {
			error++;
		}	
	});
	if(error>0){
		alert(error+"입력은 숫자, 소수점(,), 컴마(,)만 가능합니다.");
		return false;
	}
	var datas=jQuery("#formLevel0").serialize();
	//
	$('.timer').countimer("stop");
	$.ajax({
		type: "POST",		
		url:"./ajax.dhc.php",
		data:datas ,
		dataType: 'json',
		success: function(data){
				//alert(data);
				//jQuery("#examR").html(r);
				//jQuery("#examR").addClass("active");
				//return false;
				if(data[0]==1){ //에러가 있다면
				//ajax_msg(array(1,$result,$per, $is_end, $is_end ));
				var result = data[1];
				var result_str=data[2];
				var per=data[3];
				var is_end=data[4];
				for(var i=0;i<result.length;i++){
					if(result[i]==1){
						//정답
						jQuery("#examQ .examTr.exam"+i).addClass("examTrue");
					}else{
						jQuery("#examQ .examTr.exam"+i).addClass("examFalse");					
					}
				}
				jQuery("#examCon").removeClass("start").addClass("stop");
				prgressBarChange(per);
				
				jQuery("#examR").html(result_str);
				jQuery("#examR").addClass("active");
				jQuery("#examQ input.exam_answer").prop("readonly",true);
				jQuery("#examQ .examSubmitBox").css("display","none");

				return false;									
			}
			else{
				alert(data[1]);		
			}
		}
	});	
	return false;
}


//=================================
//테스트를 정의합니다. 
var level0TestCheck=0;
function level0TestSubmit(){
	if(level0TestSubmit==1){
		alert("현재 채점중입니다.");
		return false;
	}
	var error=0;
	var pattern = /(^[0-9\.\,]+$)/;
	jQuery("#formLevel0 .exam_answer").each(function(){
		var value= jQuery(this).val(); 
		if (!pattern.test(value)) {
			error++;
		}	
	});
	if(error>0){
		alert(error+"입력은 숫자, 소수점(,), 컴마(,)만 가능합니다.");
		return false;
	}
	var datas=jQuery("#formLevel0").serialize();
	
	$('.timer').countimer("stop");
	level0TestCheck=1;
	$.ajax({
		type: "POST",		
		url:"./ajax.dhc.php",
		data:datas ,
		dataType: 'json',
		success: function(data){
			if(data[0]==1){ 
				//ajax_msg(array(1,$result,$result_str, $is_end ));
				var result = data[1];
				var result_str=data[2];
				var is_end=data[3];
				for(var i=0;i<result.length;i++){
					if(result[i]==1){
						//정답
						jQuery("#examQ .examTr.exam"+i).addClass("examTrue");
					}else{
						jQuery("#examQ .examTr.exam"+i).addClass("examFalse");					
					}
				}
				jQuery("#examR").html(result_str);
				jQuery("#examQ input.exam_answer").prop("readonly",true);
				return false;									
			}
			else{
				alert(data[1]);		
				level0TestCheck=0;
			}
		}
	});	
	return false;
}