<?php
if (!defined("_GNUBOARD_")) exit; // 개별 페이지 접근 불가
include_once(G5_LIB_PATH.'/thumbnail.lib.php');

// add_stylesheet('css 구문', 출력순서); 숫자가 작을 수록 먼저 출력됨
add_stylesheet('<link rel="stylesheet" href="'.$board_com_url.'/style.css">', 0);

if($group['gr_id']=="ebook"){
	include_once $board_com_path."/list_ebook.skin.php";
}

?>
<?php if($bo_table=="level1"){?>
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
<?php }?>

<script src="<?php echo G5_JS_URL; ?>/viewimageresize.js"></script>

<!-- 게시물 읽기 시작 { -->

<article id="bo_v" style="width:<?php echo $width; ?>">
    <header>
        <h2 id="bo_v_title">
            <span class="bo_v_tit">
			 <?php
            echo cut_str(get_text($view['wr_subject']), 70); // 글제목 출력
            ?>
			</span>
        </h2>
    </header>

    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        <div class="profile_info">
        	
    	</div>

    	<!-- 게시물 상단 버튼 시작 { -->
	    <div id="bo_v_top">
	        <?php ob_start(); ?>
	        <ul class="btn_bo_user bo_v_com">
				<li><a href="<?php echo $list_href ?>" class="btn_b01 btn" title="목록"><i class="fa fa-list" aria-hidden="true"></i> 목록</a></li>
	            <?php if ($reply_href) { ?><li><a href="<?php echo $reply_href ?>" class="btn_b01 btn" title="답변"><i class="fa fa-reply" aria-hidden="true"></i> 답변</a></li><?php } ?>
	            <?php if ($write_href) { ?><li><a href="<?php echo $write_href ?>" class="btn_b01 btn" title="글쓰기"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a></li><?php } ?>
	        	<?php if($update_href || $delete_href || $copy_href || $move_href || $search_href) { ?>
				<?php if ($search_href) { ?><li><a href="<?php echo $search_href ?>" class="btn btn_b01"><i class="fa fa-search" aria-hidden="true"></i> 검색</a></li><?php } ?>
				<?php if ($update_href) { ?><li><a href="<?php echo $update_href ?>" class="btn btn_b01"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 수정</a></li><?php } ?>
				<?php if ($delete_href) { ?><li><a href="<?php echo $delete_href ?>" onclick="del(this.href); return false;" class="btn btn_b01"><i class="fa fa-trash-o" aria-hidden="true"></i> 삭제</a></li><?php } ?>
	        	<?php } ?>

				<?php if(isset($view['icon_file'])){
				$file_count=0;	
				for ($i=0; $i<count($view['file']); $i++) {
					if (isset($view['file'][$i]['source']) && $view['file'][$i]['source'] && !$view['file'][$i]['view']) {
						$file_count++;
					}
				}
				?>
				<?php if($file_count){?>
				<li>
					<a href="javascript:;" type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#downModal">
					<i class="fa fa-paperclip" aria-hidden="true"> 
					<?php 
						//echo $file_count;
					?>
					</i> 다운로드
					</a>
				</li>
				<?php }?>
				<?php }?>

	        </ul>
	        <script>

            jQuery(function($){
                // 게시판 보기 버튼 옵션
				$(".btn_more_opt.is_view_btn").on("click", function(e) {
                    e.stopPropagation();
				    $(".more_opt.is_view_btn").toggle();
				})
;
                $(document).on("click", function (e) {
                    if(!$(e.target).closest('.is_view_btn').length) {
                        $(".more_opt.is_view_btn").hide();
                    }
                });
            });
            </script>
	        <?php
	        $link_buttons = ob_get_contents();
	        ob_end_flush();
			?>
	    </div>
	    <!-- } 게시물 상단 버튼 끝 -->

    </section>

    <section id="bo_v_atc">
        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">
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
				<td style="width:100px;"><?php echo $view['wr_2'];?></td>
				<td style="width:120px;"><?php echo $view['ca_name'];?></td>
				<td  style="width:120px;"><?php echo $g5['level1_level'][$view['wr_1']];?></td>
				<td style="width:100px;"><?php echo $view['wr_good'];?></td>
				<td style="width:100px;"><?php echo $view['wr_3'];?></td>
				<td style="width:100px;"><?php echo $view['wr_4'];?></td>
			</tr>
			</table>

			<table class="table_form table_form2">
			<tr>
				<td class="head">시나리오</td>
				<td class="text"><?php echo nl2br($view['wr_content']);?></td>
			</tr>

			<?php 
			//수량을 정의
			$varCnt=intval($view['wr_3']); 
			$wr_3=$wr_4="";
			//수량 리스트 정의
			$varList=array();
			if($view['wr_5']){
				$varList=rt_decode($view['wr_5']);
			}
			
			for($i=0;$i<$varCnt;$i++)
			{
				$row=$varList[$i];

				$wr_3.="<tr>
				<td>".$row['num']."</td>
				<td>".$g5['level1_var_mode'][$row['mode']]."</td>
				<td>".$g5['level1_var_type'][$row['type']]."</td>
				<td class='text-left'>".$row['name']."</td>
				<td>".$row['min']."</td>
				<td>".$row['max']."</td>
				<td>".$row['term']."</td>
				<td>".$row['unit']."</td>
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
			$answerCnt=intval($view['wr_4']);
			$answerList=array();
			if($view['wr_6']){
				$answerList=rt_decode($view['wr_6']);
			}
			for($i=0;$i<$answerCnt;$i++){?>			
			<tr>
				<td class="head">문항<?php echo ($i+1);?></td>
				<td class="text"><?php echo $answerList[$i];?></td>
			</tr>
			<?php }?>	
			<tr>
				<td class="head">주의</td>
				<td class="text"><?php echo nl2br($view['wr_9']);?></td>
			</tr>

			<tr>
				<td class="head">풀이과정</td>
				<td class="text"><?php echo nl2br($view['wr_7']);?></td>
			</tr>
			<tr>
				<td class="head">정답내용</td>
				<td class="text "><?php echo nl2br($view['wr_8']);?></td>
			</tr>
			</table>
		</div>

		
        
		

		<?php 
		// 파일 출력
		$v_img_count = count($view['file']);
		if($v_img_count) {
			echo "<div id=\"bo_v_img\" class='text-center'>\n";

			for ($i=0; $i<=count($view['file']); $i++) {
				echo get_file_thumbnail($view['file'][$i]);
			}

			echo "</div>\n";
		}
	 
		 ?>

        <?php if ($is_signature) { ?><p><?php echo $signature ?></p><?php } ?>


        <!--  추천 비추천 시작 { -->
        <?php if ( $good_href || $nogood_href) { ?>
        <div id="bo_v_act">
            <?php if ($good_href) { ?>
            <span class="bo_v_act_gng">
                <a href="<?php echo $good_href.'&amp;'.$qstr ?>" id="good_button" class="bo_v_good"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i><span class="sound_only">추천</span><strong><?php echo number_format($view['wr_good']) ?></strong></a>
                <b id="bo_v_act_good"></b>
            </span>
            <?php } ?>
            <?php if ($nogood_href) { ?>
            <span class="bo_v_act_gng">
                <a href="<?php echo $nogood_href.'&amp;'.$qstr ?>" id="nogood_button" class="bo_v_nogood"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i><span class="sound_only">비추천</span><strong><?php echo number_format($view['wr_nogood']) ?></strong></a>
                <b id="bo_v_act_nogood"></b>
            </span>
            <?php } ?>
        </div>
        <?php } else {
            if($board['bo_use_good'] || $board['bo_use_nogood']) {
        ?>
        <div id="bo_v_act">
            <?php if($board['bo_use_good']) { ?><span class="bo_v_good"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i><span class="sound_only">추천</span><strong><?php echo number_format($view['wr_good']) ?></strong></span><?php } ?>
            <?php if($board['bo_use_nogood']) { ?><span class="bo_v_nogood"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i><span class="sound_only">비추천</span><strong><?php echo number_format($view['wr_nogood']) ?></strong></span><?php } ?>
        </div>
        <?php
            }
        }
        ?>
        <!-- }  추천 비추천 끝 -->
    </section>

    <?php
    $cnt = 0;
    if ($view['file']['count']) {
        for ($i=0; $i<count($view['file']); $i++) {
            if (isset($view['file'][$i]['source']) && $view['file'][$i]['source'] && !$view['file'][$i]['view'])
                $cnt++;
        }
    }
	?>

    <?php if($cnt) { ?>
		
    <!-- 첨부파일 시작 { -->
    <section id="bo_v_file">
        <ul>
        <?php
        // 가변 파일
        for ($i=0; $i<count($view['file']); $i++) {
            if (isset($view['file'][$i]['source']) && $view['file'][$i]['source'] && !$view['file'][$i]['view']) {
         ?>
            <li>
                <a href="<?php echo $view['file'][$i]['href'];  ?>" class="view_file_download" download>[다운로드] 
                    <?php echo $view['file'][$i]['source'] ?> <?php echo $view['file'][$i]['content'] ?> (<?php echo $view['file'][$i]['size'] ?>)
                </a>
            </li>
        <?php
            }
        }
         ?>
        </ul>
    </section>
    <!-- } 첨부파일 끝 -->
    <?php } ?>

    <?php if(isset($view['link'][1]) && $view['link'][1]) { ?>
    <!-- 관련링크 시작 { -->
    <section id="bo_v_link">
        <ul>
        <?php
        // 링크
        $cnt = 0;
        for ($i=1; $i<=count($view['link']); $i++) {
            if ($view['link'][$i]) {
                $cnt++;
                $link = cut_str($view['link'][$i], 70);
            ?>
            <li>
                <a href="<?php echo $view['link_href'][$i] ?>" target="_blank">
                    [관련링크] <?php echo $link ?>
                </a>
            </li>
            <?php
            }
        }
        ?>
        </ul>
    </section>
    <!-- } 관련링크 끝 -->
    <?php } ?>
    
    <?php if ($prev_href || $next_href) { ?>
    <ul class="bo_v_nb">
        <?php if ($prev_href) { ?><li class="btn_prv"><span class="nb_tit"><i class="fa fa-chevron-up" aria-hidden="true"></i> 이전글</span><a href="<?php echo $prev_href ?>"><?php echo $prev_wr_subject;?></a> <span class="nb_date"><?php echo str_replace('-', '.', substr($prev_wr_date, '2', '8')); ?></span></li><?php } ?>
        <?php if ($next_href) { ?><li class="btn_next"><span class="nb_tit"><i class="fa fa-chevron-down" aria-hidden="true"></i> 다음글</span><a href="<?php echo $next_href ?>"><?php echo $next_wr_subject;?></a>  <span class="nb_date"><?php echo str_replace('-', '.', substr($next_wr_date, '2', '8')); ?></span></li><?php } ?>
    </ul>
    <?php } ?>

    <?php
    // 코멘트 입출력
    //include_once(G5_BBS_PATH.'/view_comment.php');
	?>
</article>
<!-- } 게시판 읽기 끝 -->

<script>
<?php if ($board['bo_download_point'] < 0) { ?>
$(function() {
    $("a.view_file_download").click(function() {
        if(!g5_is_member) {
            alert("다운로드 권한이 없습니다.\n회원이시라면 로그인 후 이용해 보십시오.");
            return false;
        }

        var msg = "파일을 다운로드 하시면 포인트가 차감(<?php echo number_format($board['bo_download_point']) ?>점)됩니다.\n\n포인트는 게시물당 한번만 차감되며 다음에 다시 다운로드 하셔도 중복하여 차감하지 않습니다.\n\n그래도 다운로드 하시겠습니까?";

        if(confirm(msg)) {
            var href = $(this).attr("href")+"&js=on";
            $(this).attr("href", href);

            return true;
        } else {
            return false;
        }
    });
});
<?php } ?>

function board_move(href)
{
    window.open(href, "boardmove", "left=50, top=50, width=500, height=550, scrollbars=1");
}
</script>

<script>
$(function() {
    $("a.view_image").click(function() {
        window.open(this.href, "large_image", "location=yes,links=no,toolbar=no,top=10,left=10,width=10,height=10,resizable=yes,scrollbars=no,status=no");
        return false;
    });

    // 추천, 비추천
    $("#good_button, #nogood_button").click(function() {
        var $tx;
        if(this.id == "good_button")
            $tx = $("#bo_v_act_good");
        else
            $tx = $("#bo_v_act_nogood");

        excute_good(this.href, $(this), $tx);
        return false;
    });

    // 이미지 리사이즈
    $("#bo_v_atc").viewimageresize();
});

function excute_good(href, $el, $tx)
{
    $.post(
        href,
        { js: "on" },
        function(data) {
            if(data.error) {
                alert(data.error);
                return false;
            }

            if(data.count) {
                $el.find("strong").text(number_format(String(data.count)));
                if($tx.attr("id").search("nogood") > -1) {
                    $tx.text("이 글을 비추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
                } else {
                    $tx.text("이 글을 추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
                }
            }
        }, "json"
    );
}
</script>
<!-- } 게시글 읽기 끝 -->

<!-- Modal -->
<div class="modal fade" id="downModal" tabindex="-1" aria-labelledby="downModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="downModalLabel">다운로드</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<ul class="row itemCon">
        <?php
        // 가변 파일
        for ($i=0; $i<count($view['file']); $i++) {
            if (isset($view['file'][$i]['source']) && $view['file'][$i]['source'] && !$view['file'][$i]['view']) {
         ?>
            <li class="col-12 col-sm-6">
				
                <a href="<?php echo $view['file'][$i]['href'];  ?>" class="view_file_download" download><i class="fa fa-download" aria-hidden="true"></i>  
                    <?php echo $view['file'][$i]['source'] ?> <?php echo $view['file'][$i]['content'] ?> (<?php echo $view['file'][$i]['size'] ?>)
                </a>
            </li>
        <?php
            }
        }
         ?>
        </ul>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

