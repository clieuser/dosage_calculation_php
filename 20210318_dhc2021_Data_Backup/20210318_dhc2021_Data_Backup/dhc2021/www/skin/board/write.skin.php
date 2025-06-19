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
	<?php if ($is_category) { ?>
		<?php if($bo_table=="mainbanner"){?>
		<tr>
			<td class="head">분류</td>
			<td class="text">
				<div class="d-flex align-items-center">
				<select name="ca_name" id="ca_name" class="form-control mr-2" style="width:100px;" required>
				<option value="">분류선택</option>
				<?php echo $category_option; ?>
				</select>			
				<select name="wr_3" id="wr_3" class="mr-2" required style="width:130px;">
				<?php 
				$counter = count($g5['mainBanner']);
				for($m=1;$m<$counter;$m++){
					echo "<option value='{$m}' ".(($write['wr_3']==$m)?'selected':'').">".$g5['mainBanner'][$m]."</option>"; 
				}
				?>
				</select>

				<script type="text/javascript">
				<!--
					jQuery(document).ready(function(){
						jQuery("#ca_name option").last().remove();
					});
				//-->
				</script>
				</div>
			</td>
		</tr>
		<?php }else{?>
		<tr>
			<td class="head">분류</td>
			<td class="text">
			<select name="ca_name" id="ca_name" class="form-control" required>
				<option value="">분류를 선택하세요</option>
				<?php echo $category_option; ?>
			</select></td>
		</tr>
		<?php }?>
    <?php } ?>

	<?php if ($is_name) { ?>
	<tr>
		<td class="head">이름</td>
		<td class="text"><input type="text" name="wr_name" value="<?php echo $name ?>" id="wr_name" required class="form-control required" placeholder="이름" style="width:150px;"></td>
	</tr>
	<?php } ?>

	<?php if ($is_password) { ?>
	<tr>
		<td class="head">비밀번호</td>
		<td class="text"><input type="password" name="wr_password" id="wr_password" <?php echo $password_required ?> class="form-control <?php echo $password_required ?>" placeholder="비밀번호" style="width:150px;"></td>
	</tr>
	<?php } ?>

	<?php if ($is_email) { ?>
	<tr>
		<td class="head">이메일</td>
		<td class="text"><input type="text" name="wr_email" value="<?php echo $email ?>" id="wr_email" class="form-control email " placeholder="이메일" style="width:100%;"></td>
	</tr>
	<?php } ?>    

	<?php if ($is_homepage) { ?>
		<tr>
			<td class="head">홈페이지</td>
			<td class="text"><input type="text" name="wr_homepage" value="<?php echo $homepage ?>" id="wr_homepage" class="form-control" maxlength="50" placeholder="홈페이지"  style="width:100%;"></td>
		</tr>
	<?php } ?>
	
	<?php
	$wr_link_count=G5_LINK_COUNT;
	if($bo_table=="mainbanner"){
		$wr_link_count=1;
		?>
		<tr>
			<td class="head">옵션</td>
			<td class="text">
			<div class="d-flex align-items-center">
			 <input type="text" name="wr_1" value="<?php echo $write['wr_1'] ?>" id="wr_1" class="frm_input mr-2" size="5" placeholder="순서"  style="width:80px;"> 
			<input type="checkbox" name="wr_2" value="1" class="mr-1" <?php echo (($write['wr_2']==1)?"checked":"");?> class='mr-1' style="display:inline-block;width:20px;height:20px;"> 내용사용
			</div>
		</tr>
	<?php }else{?>
	    <?php if ($option) { ?>
	<tr>
		<td class="head">옵션</td>
		<td class="text"><?php echo $option ?></td>
	</tr>
		<?php }?>
	<?php } ?>
	<tr>
		<td class="head">제목</td>
		<td class="text">
		<?php echo $option_hidden;?>
		<input type="text" name="wr_subject" value="<?php echo $subject ?>" id="wr_subject" required class="form-control required"  maxlength="255" placeholder="제목" style="width:100%;"></td>
	</tr>

	

	<?php if(G5_IS_MOBILE){?>
	<tr>
		<td class="text" colspan="2">
		<div class="mb-1">내용</div>
	<?php }else{?>
	<tr>
		<td class="head">내용</td>
		<td class="text">
	<?php }?>			
			<div class="write_div">
				<label for="wr_content" class="sound_only">내용<strong>필수</strong></label>
				<div class="wr_content <?php echo $is_dhtml_editor ? $config['cf_editor'] : ''; ?>">
					<?php if($write_min || $write_max) { ?>
					<!-- 최소/최대 글자 수 사용 시 -->
					<p id="char_count_desc">이 게시판은 최소 <strong><?php echo $write_min; ?></strong>글자 이상, 최대 <strong><?php echo $write_max; ?></strong>글자 이하까지 글을 쓰실 수 있습니다.</p>
					<?php } ?>
					<?php echo $editor_html; // 에디터 사용시는 에디터로, 아니면 textarea 로 노출 ?>
					<?php if($write_min || $write_max) { ?>
					<!-- 최소/최대 글자 수 사용 시 -->
					<div id="char_count_wrap"><span id="char_count"></span>글자</div>
					<?php } ?>
				</div>
			</div>
		</td>
	</tr>


	<?php if($bo_table=="mainbanner"){?>
	<tr>
		<td class="head">타이틀(메인 카피)</td>
		<td class="text">
		<textarea name="wr_5" style="width:100%;height:80px;"><?php echo $write['wr_5'];?></textarea></td>
	</tr>
	<tr>
		<td class="head">타이틀2(메인 서브카피)</td>
		<td class="text">
		<textarea name="wr_6" style="width:100%;height:80px;"><?php echo $write['wr_6'];?></textarea>
	</tr>

	<?php }?>


    <?php for ($i=1; $is_link && $i<=$wr_link_count; $i++) { ?>
	<tr>
		<td class="head"> 링크  #<?php echo $i ?></td>
		<td class="text"><input type="text" name="wr_link<?php echo $i ?>" value="<?php if($w=="u"){ echo $write['wr_link'.$i]; } ?>" id="wr_link<?php echo $i ?>" class="form-control" style="max-width:100%;"></td>
	</tr>
    <?php } ?>

    <?php for ($i=0; $is_file && $i<$file_count; $i++) { ?>
	<tr>
		<td class="head">파일 #<?php echo $i+1 ?></td>
		<td class="text">
			<div class="mb-1">
				<input type="file" name="bf_file[]" id="bf_file_<?php echo $i+1 ?>" title="파일첨부 <?php echo $i+1 ?> : 용량 <?php echo $upload_max_filesize ?> 이하만 업로드 가능" class="frm_file ">
				<?php if($w == 'u' && $file[$i]['file']) { ?>
				<span class="file_del">
					<input type="checkbox" id="bf_file_del<?php echo $i ?>" name="bf_file_del[<?php echo $i;  ?>]" value="1"> <label for="bf_file_del<?php echo $i ?>"><?php echo $file[$i]['source'].'('.$file[$i]['size'].')';  ?> 파일 삭제</label>
				</span>
				<?php } ?>
			</div>
			<?php if ($is_file_content) { ?>
			<input type="text" name="bf_content[]" value="<?php echo ($w == 'u') ? $file[$i]['bf_content'] : ''; ?>" title="파일 설명을 입력해주세요." class="full_input frm_input" size="50" placeholder="파일 설명을 입력해주세요.">
			<?php } ?>
		</td>
	</tr>
    <?php } ?>
    <?php if ($is_use_captcha) { //자동등록방지  ?>
		<?php if(G5_IS_MOBILE){?>
		<tr>
			<td class="text" colspan="2"><?php echo $captcha_html ?></td>
		</tr>		
		<?php }else{?>
		<tr>
			<td class="head">캡차</td>
			<td class="text"><?php echo $captcha_html ?></td>
		</tr>
		<?php }?>
	<?php } ?>
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