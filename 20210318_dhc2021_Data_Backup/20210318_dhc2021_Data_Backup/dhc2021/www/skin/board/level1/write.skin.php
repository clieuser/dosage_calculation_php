<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가
/*
wr_1 : 상중하 시나리오 레벨 tiny int
wr_2 : 시나리오 번호 : tiny no 
wr_3 : 변수수 : tiny no
wr_4 : 문항수 : tiny no

wr_5 : 변수 저장 : text
wr_6 : 문항 저장 : text
wr_7 : 풀이과정 : text
wr_8 : 정답 내용 text 
*/
$board_com_url=G5_SKIN_URL."/board";
// add_stylesheet('css 구문', 출력순서); 숫자가 작을 수록 먼저 출력됨
add_stylesheet('<link rel="stylesheet" href="'.$board_com_url.'/style.css">', 0);

?>

<section id="bo_w" style="width:<?php echo $width; ?>">
    <h2 class="sound_only"><?php echo $g5['title'] ?></h2>

    <!-- 게시물 작성/수정 시작 { -->
    <form name="fwrite" id="fwrite" action="<?php echo $action_url ?>" onsubmit="return fwrite_submit(this);" method="post" enctype="multipart/form-data" autocomplete="off" style="width:<?php echo $width; ?>">
    <input type="hidden" name="uid" value="<?php echo get_uniqid(); ?>">
    <input type="hidden" name="w" value="<?php echo $w ?>">
    <input type="hidden" name="bo_table" value="<?php echo $bo_table ?>">
    <input type="hidden" name="wr_id" value="<?php echo $wr_id ?>">
    <input type="hidden" name="sca" value="<?php echo $sca ?>">
    <input type="hidden" name="sfl" value="<?php echo $sfl ?>">
    <input type="hidden" name="stx" value="<?php echo $stx ?>">
    <input type="hidden" name="spt" value="<?php echo $spt ?>">
    <input type="hidden" name="sst" value="<?php echo $sst ?>">
    <input type="hidden" name="sod" value="<?php echo $sod ?>">
    <input type="hidden" name="page" value="<?php echo $page ?>">
    
	
	<table class="table_list" style="width:640px;margin:10px 0px;">
	<tr class="head">
		<td>No.</td>
		<td>사용</td>
		<td>레벨</td>
		<td>순서</td>
		<td>변수 수</td>
		<td>문항 수</td>
	</tr>
	<tr>
		<td style="width:100px;">
			<input type="text" name="wr_2" id="wr_2" value="<?php echo $write['wr_2'];?>" class="form-control">
		</td>
		<td style="width:120px;">
			<select name="ca_name" id="ca_name" class="form-control" required >
			<?php echo $category_option; ?>
			</select>
		</td>

		<td  style="width:120px;">
			<select name="wr_1" id="wr_1" class="form-control">
			<?php 
			foreach($g5['level1_level'] as $key => $value){
				echo "<option value='{$key}' ".(($key==$write['wr_1'])?"selected":"").">{$value}</option>";
			}
			?>
			</select>
		</td>
		<td style="width:100px;">
			<input type="text" name="wr_good" id="wr_good" value="<?php echo $write['wr_good'];?>" class="form-control">
		</td>
		<td style="width:100px;">
			<input type="text" name="wr_3" id="wr_3" value="<?php echo $write['wr_3'];?>" class="form-control" maxlength="2" required>
		</td>
		<td style="width:100px;">
			<input type="text" name="wr_4" id="wr_4" value="<?php echo $write['wr_4'];?>" class="form-control" maxlength="2" required>
		</td>
	</tr>
	</table>
	

	<table class="table_form table_form2">
	<tr>
		<td class="head">제목</td>
		<td class="text">
		<input type="text" name="wr_subject" id="wr_subject" value="<?php echo $write['wr_subject'];?>" class="form-control required" required>
		</td>
	</tr>
	<tr>
		<td class="head">시나리오</td>
		<td class="text">
		<textarea name="wr_content" id="wr_content" class="form-control wr_textarea"><?php echo $write['wr_content'];?></textarea>
		</td>
	</tr>

	<?php if($w=="u"){
		//수량을 정의
		$varCnt=intval($write['wr_3']); 
		$wr_3 = $wr_4 = "";
		
		//옵션을 정의
		$modeOption=$typeOption="";
		foreach($g5['level1_var_type'] as $key => $value){
			$typeOption.="<option value='{$key}'>{$value}</option>";
		}

		foreach($g5['level1_var_mode'] as $key => $value){
			$modeOption.="<option value='{$key}'>{$value}</option>";
		}
		
		//수량 리스트 정의
		$varList=array();
		if($write['wr_5']){
			$varList=rt_decode($write['wr_5']);
		}
		
		for($i=0;$i<$varCnt;$i++)
		{
			$row=$varList[$i];
			//옵션을 정의한다
			$typeOptionStr=str_replace("value='{$row['type']}'", "value='{$row['type']}' selected", $typeOption);

			$modeOptionStr=str_replace("value='{$row['mode']}'", "value='{$row['mode']}' selected", $modeOption);			

			$wr_3.="<tr>
			<td><input type='text' name=\"varCon[".$i."][num]\" value=\"".$row['num']."\" class='form-control'></td>
			<td>
				<select name=\"varCon[".$i."][mode]\" class='form-control'>".$modeOptionStr."</select>
			</td>
			<td>
				<select name=\"varCon[".$i."][type]\" class='form-control'>".$typeOptionStr."</select>
			</td>
			<td>
				<input type='text' name=\"varCon[".$i."][name]\" value=\"".$row['name']."\" class='form-control'>
			</td>
			<td>
				<input type='text' name=\"varCon[".$i."][min]\" value=\"".$row['min']."\" class='form-control'>
			</td>
			<td>
				<input type='text' name=\"varCon[".$i."][max]\" value=\"".$row['max']."\" class='form-control'>
			</td>
			<td>
				<input type='text' name=\"varCon[".$i."][term]\" value=\"".$row['term']."\" class='form-control'>
			</td>
			<td>
				<input type='text' name=\"varCon[".$i."][unit]\" value=\"".$row['unit']."\" class='form-control'>
			</td>
			</tr>";
		}
	?>
		<tr>
			<td class="head">변수내용</td>
			<td class="text">
			<table class="table_list table_list2">
			<tr class="head">
				<td style="width:70px;">No</td>
				<td style="width:100px;">변수</td>
				<td style="width:100px;">타입</td>
				<td>내용</td>
				<td style="width:90px;">Min</td>
				<td style="width:90px;">Max</td>
				<td style="width:90px;">증분</td>
				<td style="width:90px;">단위</td>
			</tr>
			<?php echo $wr_3; ?>
			</table>
			</td>
		</tr>
		<?php 
		$answerCnt=intval($write['wr_4']);
		$answerList=array();
		if($write['wr_6']){
			$answerList=rt_decode($write['wr_6']);
			$unitCon=rt_decode($write['wr_10']);
		}
		for($i=0;$i<$answerCnt;$i++){?>			
		<tr>
			<td class="head">문항<?php echo ($i+1);?></td>
			<td class="text">
				<input type="text" name="answerCon[<?php echo $i;?>]"  value="<?php echo $answerList[$i];?>" class="form-control">
			</td>
		</tr>
		<tr>
			<td class="head">단위<?php echo ($i+1);?></td>
			<td class="text">
				<input type="text" name="unitCon[<?php echo $i;?>]"  value="<?php echo $unitCon[$i];?>" class="form-control" style='width:100px;'>
			</td>
		</tr>

		
		<?php }?>	
	<?php }?>	
	<tr>
		<td class="head">주의</td>
		<td class="text">
		<input type="text" name="wr_9" id="wr_9" value="<?php echo $write['wr_9'];?>" class="form-control">
		</td>
	</tr>
	<tr>
		<td class="head">풀이과정</td>
		<td class="text">
		<textarea name="wr_7" id="wr_7" class="form-control wr_textarea"><?php echo $write['wr_7'];?></textarea>
		</td>
	</tr>
	<tr>
		<td class="head">정답내용</td>
		<td class="text">
		<textarea name="wr_8" id="wr_8" class="form-control wr_textarea"><?php echo $write['wr_8'];?></textarea>
		</td>
	</tr>

	

	</table>
    <div class="btn_confirm write_div my-4">
        <a href="<?php echo get_pretty_url($bo_table); ?>" class="btn btn-secondary">취소</a>
        <button type="submit" id="btn_submit" accesskey="s" class="btn btn-primary">작성완료</button>
    </div>
    </form>

    <script>
    <?php if($write_min || $write_max) { ?>
    // 글자수 제한
    var char_min = parseInt(<?php echo $write_min; ?>); // 최소
    var char_max = parseInt(<?php echo $write_max; ?>); // 최대
    check_byte("wr_content", "char_count");

    $(function() {
        $("#wr_content").on("keyup", function() {
            check_byte("wr_content", "char_count");
        });
    });

    <?php } ?>
    function html_auto_br(obj)
    {
        if (obj.checked) {
            result = confirm("자동 줄바꿈을 하시겠습니까?\n\n자동 줄바꿈은 게시물 내용중 줄바뀐 곳을<br>태그로 변환하는 기능입니다.");
            if (result)
                obj.value = "html2";
            else
                obj.value = "html1";
        }
        else
            obj.value = "";
    }

    function fwrite_submit(f)
    {
        <?php echo $editor_js; // 에디터 사용시 자바스크립트에서 내용을 폼필드로 넣어주며 내용이 입력되었는지 검사함   ?>

        var subject = "";
        var content = "";
        $.ajax({
            url: g5_bbs_url+"/ajax.filter.php",
            type: "POST",
            data: {
                "subject": f.wr_subject.value,
                "content": f.wr_content.value
            },
            dataType: "json",
            async: false,
            cache: false,
            success: function(data, textStatus) {
                subject = data.subject;
                content = data.content;
            }
        });

        if (subject) {
            alert("제목에 금지단어('"+subject+"')가 포함되어있습니다");
            f.wr_subject.focus();
            return false;
        }

        if (content) {
            alert("내용에 금지단어('"+content+"')가 포함되어있습니다");
            if (typeof(ed_wr_content) != "undefined")
                ed_wr_content.returnFalse();
            else
                f.wr_content.focus();
            return false;
        }

        if (document.getElementById("char_count")) {
            if (char_min > 0 || char_max > 0) {
                var cnt = parseInt(check_byte("wr_content", "char_count"));
                if (char_min > 0 && char_min > cnt) {
                    alert("내용은 "+char_min+"글자 이상 쓰셔야 합니다.");
                    return false;
                }
                else if (char_max > 0 && char_max < cnt) {
                    alert("내용은 "+char_max+"글자 이하로 쓰셔야 합니다.");
                    return false;
                }
            }
        }

        <?php echo $captcha_js; // 캡챠 사용시 자바스크립트에서 입력된 캡챠를 검사함  ?>

        document.getElementById("btn_submit").disabled = "disabled";

        return true;
    }
    </script>
</section>
<!-- } 게시물 작성/수정 끝 -->

<pre>

임의수정시 오류가 날수 있으니 환경변수의 내용만 수정하시기 바랍니다. 

레벨1 시나리오 관리자

######################################
A. 시나리오 구성은

1. 고유번호
2. 환경,계산 변수
3. 시나리오 내용 
4. 풀이과정
5. 입력변수
6. 계산식
7. 해답변수
8. 해답
으로 되어있습니다.
내용들은 서로 연관되어있고 각 시나리오별로 내용이 다릅니다. 
계산식과 해답변수는 프로그램에서 돌아가기 때문에
프로그램을 직접 수정해야 합니다. 


######################################
B. 문제 생성과 정답확인 과정은?

출제할 고유번호의 시나리오 정보를 가져온후 
환경, 계산 변수를 랜덤하게 생성합니다.
시나리오에 대입합니다. 
해답을 위해 각 변수를 저장해 놓습니다. 

정답제출시 랜덤으로 생성된 환경 계산변수와 정답이 넘어옵니다. 
넘어온 값을 계산식을 통해 해답변수와 정답을 생성합니다. 
계산식은 계산변수에 영향을 받기에 계산 변수를 수정시에는 주의를 요합니다. 

나온 해답변수를 해답내용에 대입합니다. 


######################################
C 시나리오 입력, 수정 내용  

1. No : 시나리오의 고유번호
	이값은 변경하시면 안됩니다.
	해답과정과 연결되어있고 변경시 다른 문항과 충돌이 있을수 있습니다. 

2. 사용 : 노출여부
	사용 , 미사용으로 구분되면 미사용시 문제에 노출되지 않습니다. 

3. 레벨 : 분류 
	기초, 중급, 고급으로 분류를 나누어 줍니다. 

4. 순서 
	관리자 리스트에서의 순서를 의미합니다. 

5. 변수 수 
	변수를 추가시키거나 감소할수 있습니다. 
	(임의로 감소를 하시고 계산식에서 넘어오는 변수가 문제가 있을시 계산 오류가 날수있습니다.
	추가시에 환경변수는 상관없지만 계산변수는 계산식을 따로 수정해야 합니다.)

6. 문항수 
	출제되는 문항수를 알려줍니다 
	추가/삭제 시 계산식을 수정해야 합니다.

7. 제목 
	문제 생성시 노출되는 유형입니다. 

8 시나리오
	- {} 로 되어있는부분은 문제 생성시 치환되는 부분입니다. 
	환경변수, 계산변수의 경우 치환시 힌트보기에서 색상이 표시가 자동으로 붙습니다.

	- {1} 로 숫자로 표기되는 부분은 변수의 고유값이 치환되는것입니다. 
	- {sh1}{/sh} , {sh2}{/sh}. {sh3}{/sh}  
	임의의 힌트를 정의합니다 
	항상 쌍으로 적용해야 되면 {/sh} 를 미적용시 문제가 생길수도 있습니다.
	- {1W}, {1H} 나이에 따른 몸무게를 노출시 치환됩니다. 
	변수 고유번호 1 이 나이이고 단위에 2가 적용되고 
	변수 고유번호 2 가 성별이고 Min 부분은 A,B,C 타입을 구분해야 정확히 치환이 됩니다. 

	- {6A} {7B} 숫자와 영문자가 나오는 변환은 
	변수중 약물에 해당되면 min 값과 max 값으로 해당 내용을 구분합니다. 
	10|100;200mg|500mg;20mL|40L
	; => 구분자입니다.  
	| => ; 로 구분된 내용을 '|' 로 구분합니다. 
	다른형식 예 
	10,1|100,2;200mg|500mg;20mL|40L
	앞에 , 구분자가 생성됩니다. 계산식에서 사용 됩니다.
	
	
	min : ';' 로 분리된 처음 내용을 | 로 분리했을때 ',' 로 분리된수 
	max : ';' 로 분리된 순

	10|100;200mg|500mg;20mL|40L
	경우 min : 1 , max : 3
	
	10,1|100,2;200mg|500mg;20mL|40L
	경우 min : 2 , max : 3

	예시
	10|100;200mg|500mg;20mL|40L
	고유번호가 7이면
	200mg 이나 500mg 은 {7A}로
	20mL 나 40L 는 {7B}로 
	10은 {7} 로 표기됩니다 
	계산식경우 제일 앞에 분리된 내용이 사용되기때문에 
	주의해서 사용해야 합니다. 

9. 변수 내용 
	
	a. No : 고유 변수 내용 
	고유 번호입니다. 계산변수경우 계산식에 에러가 생길수 있습니다.

	b. 변수종류 환경 , 계산 
	계산변수 고유번호와 내용 변경시 에러 날수 있습니다. 
	환경변수 변경시 시나리오에 등록된 변수도 변경

	c. 타입 
	- 고정 : 내용에 있는 내용이 치환됩니다. 
	- 분리 : | 를 구분자로 치환됩니다. 
	분리변수에 성별의 경우 남,여로 구분
	남아|여아 , 남성|여성 , 남자|여자 구분가능
	- 범위 : min , max 정수 등록후 증분을 사용합니다. 
	0.1 ~ 0.7 인경우  min : 1 , max: 7 증분은 0.1 입니다. 
	- 나이 : 나이는 성별과 관련 몸무게 키를 노출되야 될때 지정합니다. 
	만약 나이 성별 몸무게 키를 노출해야하면 
	1. 나이 , 2. 성별을 입력해야 합니다. 
	몸무게 타입은 위에 설명했습니다. 
	- 약물 : 위 시나리오에 설명했습니다. 

10. 풀이과정
	mathjax 를 사용하여 수식을 표시합니다. 
	https://www.mathjax.org/

11. 정답내용
	계산식에 나온 변수를 치환합니다. 
	계산식과 연동되어있으므로 수정이 불가능합니다.
</pre>