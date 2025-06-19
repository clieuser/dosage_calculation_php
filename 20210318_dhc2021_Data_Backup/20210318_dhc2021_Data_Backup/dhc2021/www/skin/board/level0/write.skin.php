<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

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
    <table class="table_form">
	<?php
    $option = '';
    $option_hidden = '';
    if ($is_notice || $is_html || $is_secret || $is_mail) { 
        $option = '';
        if ($is_notice) {
            $option .= PHP_EOL.'<input type="checkbox" id="notice" name="notice" value="1" '.$notice_checked.'>'.PHP_EOL.'<label for="notice" class="mr-2"><span></span>공지</label>';
        }
        if ($is_html) {
            if ($is_dhtml_editor) {
                $option_hidden .= '<input type="hidden" value="html1" name="html">';
            } else {
                $option .= PHP_EOL.'<input type="checkbox" id="html" name="html" onclick="html_auto_br(this);"  value="'.$html_value.'" '.$html_checked.'>'.PHP_EOL.'<label for="html" class="mr-2"><span></span>html</label>';
            }
        }
        if ($is_secret) {
            if ($is_admin || $is_secret==1) {
                $option .= PHP_EOL.'<input type="checkbox" id="secret" name="secret"   value="secret" '.$secret_checked.'>'.PHP_EOL.'<label for="secret" class="mr-2"><span></span>비밀글</label>';
            } else {
                $option_hidden .= '<input type="hidden" name="secret" value="secret">';
            }
        }
        if ($is_mail) {
            $option .= PHP_EOL.'<input type="checkbox" id="mail" name="mail"  class="selec_chk" value="mail" '.$recv_email_checked.'>'.PHP_EOL.'<label for="mail" class="mr-2"><span></span>답변메일받기</label>';
        }
    }
    ?>
	
	<tr>
		<td class="head">상태/분류</td>
		<td class="text">
		<div style="display:flex;align-items:center;">
		<select name="ca_name" id="ca_name" class="form-control mr-2" required style="width:100px">
			<?php echo $category_option; ?>
		</select>
		 
		<select name="wr_1" id="wr_1" style="width:100px;">
		<?php 
		$type_array=array("무게","부피","시간","길이");
		foreach($type_array as $value){
			echo "<option value='{$value}' ".(($value==$write['wr_1'])?"selected":"").">{$value}</option>";
		}
		?>
		</select>
		</div>
		</td>
	</tr>
	
	<tr>
		<td class="head">변환</td>
		<td class="text">
		<input type="text" name="wr_subject" id="wr_subject" value="<?php echo $write['wr_subject'];?>" class="form-control required" required style="width:200px;">
		</td>
	</tr>

	<tr>
		<td class="head">설명</td>
		<td class="text">
		<input type="text" name="wr_content" id="wr_content" value="<?php echo $write['wr_content'];?>" class="form-control" style="width:100%;">
		</td>
	</tr>

	<tr>
		<td class="head">범위</td>
		<td class="text">
<input type="text" name="wr_5" id="wr_5" value="<?php echo $write['wr_5'];?>" class="form-control" style="width:80px;display:inline-block;"> ~
<input type="text" name="wr_6" id="wr_6" value="<?php echo $write['wr_6'];?>" class="form-control" style="width:80px;display:inline-block;">
		</td>
	</tr>

	<tr>
		<td class="head">X 배수</td>
		<td class="text">
		<select name="wr_4" class="form-control" style="width:100px;display:inline-block;">
		<option value='0'>곱셈</option>
		<option value='1' <?php echo (($write['wr_4'])?"selected":"");?>>나누기</option>
		</select>	
		<input type="text" name="wr_2" id="wr_2" value="<?php echo $write['wr_2'];?>" class="form-control" style="width:100px;display:inline-block;">
		</td>
	</tr>

	<tr>
		<td class="head">소수자리</td>
		<td class="text">
		<input type="text" name="wr_3" id="wr_3" value="<?php echo $write['wr_3'];?>" class="form-control" style="width:100px;">
		</td>
	</tr>
	<tr>
		<td class="head">순서</td>
		<td class="text">
		<input type="text" name="wr_good" id="wr_good" value="<?php echo $write['wr_good'];?>" class="form-control" style="width:100px;">
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