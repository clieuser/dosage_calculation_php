<?php
// 이 파일은 새로운 파일 생성시 반드시 포함되어야 함
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

// 테마 head.sub.php 파일
if(!defined('G5_IS_ADMIN') && defined('G5_THEME_PATH') && is_file(G5_THEME_PATH.'/head.sub.php')) {
    require_once(G5_THEME_PATH.'/head.sub.php');
    return;
}

$g5_debug['php']['begin_time'] = $begin_time = get_microtime();

if (!isset($g5['title'])) {
    $g5['title'] = $config['cf_title'];
    $g5_head_title = $g5['title'];
}
else {
    $g5_head_title = $g5['title']; // 상태바에 표시될 제목
    $g5_head_title .= " | ".$config['cf_title'];
}

$g5['title'] = strip_tags($g5['title']);
$g5_head_title = strip_tags($g5_head_title);

// 현재 접속자
// 게시판 제목에 ' 포함되면 오류 발생
$g5['lo_location'] = addslashes($g5['title']);
if (!$g5['lo_location'])
    $g5['lo_location'] = addslashes(clean_xss_tags($_SERVER['REQUEST_URI']));
$g5['lo_url'] = addslashes(clean_xss_tags($_SERVER['REQUEST_URI']));
if (strstr($g5['lo_url'], '/'.G5_ADMIN_DIR.'/') || $is_admin == 'super') $g5['lo_url'] = '';

/*
// 만료된 페이지로 사용하시는 경우
header("Cache-Control: no-cache"); // HTTP/1.1
header("Expires: 0"); // rfc2616 - Section 14.21
header("Pragma: no-cache"); // HTTP/1.0
*/
?>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<?php
if (G5_IS_MOBILE) {
    echo '<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">'.PHP_EOL;
    echo '<meta name="HandheldFriendly" content="true">'.PHP_EOL;
    echo '<meta name="format-detection" content="telephone=no">'.PHP_EOL;
} else {
    echo '<meta http-equiv="imagetoolbar" content="no">'.PHP_EOL;
    echo '<meta http-equiv="X-UA-Compatible" content="IE=Edge">'.PHP_EOL;
}

?>
<meta name="description" content="간호대생, 간호사를 위한 실제 의료현장에서 사용되는 약물 처방 사례를 종합하여 약물 용량을 계산하는 이러닝 서비스. 의료현장에서의 실제 상황과 실제 약물 처방 상황을 시나리오화 하여 처방된 약물을 신속 정확하게 계산함으로 의료현장에서 약물용량계산의 실수에서 오는 의료 사고를 최소화 할 수 있다">
<meta property="og:type" content="website"> 
<meta property="og:title" content="대구보건대학교 간호대학 약물용량처방 트레이닝 프로그램"> 
<meta property="og:description" content="간호대생, 간호사를 위한 실제 의료현장에서 사용되는 약물 처방 사례를 종합하여 약물 용량을 계산하는 이러닝 서비스. 의료현장에서의 실제 상황과 실제 약물 처방 상황을 시나리오화 하여 처방된 약물을 신속 정확하게 계산함으로 의료현장에서 약물용량계산의 실수에서 오는 의료 사고를 최소화 할 수 있다">
<meta property="og:keywords" content="대구보건대학교,간호대,간호사,간호대생,약물용량,수액,주사,처방,대학병원,병원">

<meta property="og:image" content="/img/logo4.jpg">
<meta property="og:url" content="">

<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="간호대생 약물처방 트레이닝"> 
<meta name="twitter:description" content="">
<meta name="twitter:image" content="/img/logo4.jpg">
<meta name="twitter:domain" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">

<?php 

if($config['cf_add_meta'])
    echo $config['cf_add_meta'].PHP_EOL;
?>
<title><?php echo $g5_head_title; ?></title>
<?php
if (defined('G5_IS_ADMIN')) {
    if(!defined('_THEME_PREVIEW_'))
        echo '<link rel="stylesheet" href="'.run_replace('head_css_url', G5_ADMIN_URL.'/css/admin.css?ver='.G5_CSS_VER, G5_URL).'">'.PHP_EOL;
} else {
    echo '<link rel="stylesheet" href="'.run_replace('head_css_url', G5_CSS_URL.'/'.(G5_IS_MOBILE ?'default_dhc':'default_dhc').'.css?ver='.G5_CSS_VER, G5_URL).'">'.PHP_EOL;
}
?>
<!--[if lte IE 8]>
<script src="<?php echo G5_JS_URL ?>/html5.js"></script>
<![endif]-->
<script>

// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "<?php echo G5_URL ?>";
var g5_bbs_url   = "<?php echo G5_BBS_URL ?>";
var g5_is_member = "<?php echo isset($is_member)?$is_member:''; ?>";
var g5_is_admin  = "<?php echo isset($is_admin)?$is_admin:''; ?>";
var g5_is_mobile = "<?php echo G5_IS_MOBILE ?>";
var g5_bo_table  = "<?php echo isset($bo_table)?$bo_table:''; ?>";
var g5_sca       = "<?php echo isset($sca)?$sca:''; ?>";
var g5_editor    = "<?php echo ($config['cf_editor'] && $board['bo_use_dhtml_editor'])?$config['cf_editor']:''; ?>";
var g5_cookie_domain = "<?php echo G5_COOKIE_DOMAIN ?>";
<?php if(defined('G5_IS_ADMIN')) { ?>
var g5_admin_url = "<?php echo G5_ADMIN_URL; ?>";
<?php } ?>
</script>

<?php
//add_javascript('<script src="'.G5_JS_URL.'/jquery-1.12.4.min.js"></script>', 0);
add_javascript('<script src="/js/jquery-3.5.1.min.js"></script>', 0);
add_javascript('<script src="'.G5_JS_URL.'/jquery-migrate-1.4.1.min.js"></script>', 0);
//add_javascript('<script src="'.G5_JS_URL.'/jquery.menu.js?ver='.G5_JS_VER.'"></script>', 0);
add_javascript('<script src="'.G5_JS_URL.'/common.js?ver='.G5_JS_VER.'"></script>', 0);
add_javascript('<script src="'.G5_JS_URL.'/wrest.js?ver='.G5_JS_VER.'"></script>', 0);
add_javascript('<script src="'.G5_JS_URL.'/placeholders.min.js"></script>', 0);
add_stylesheet('<link rel="stylesheet" href="'.G5_JS_URL.'/font-awesome/css/font-awesome.min.css">', 0);

if(G5_IS_MOBILE) {
    add_javascript('<script src="'.G5_JS_URL.'/modernizr.custom.70111.js"></script>', 1); // overflow scroll 감지
}
if(!defined('G5_IS_ADMIN')){
    echo $config['cf_add_script'];
?>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<!-- icon -->
<link rel="stylesheet" href="/plugin/Font-Awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css" />

<link rel="stylesheet" href="/css/bootstrap-side-modals.css">

<link rel="stylesheet" href="/plugin/swiper/package/css/swiper.min.css">

<link href="/css/font/font3.css" rel="stylesheet" type="text/css" />
<!-- <link href="/css/font/score.css" rel="stylesheet" type="text/css" /> -->

<link href="/css/font/nanum_square.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="/plugin/jquery-confirm/jquery-confirm.min.css?ver=<?php echo G5_CSS_VER;?>">

<link rel="stylesheet" href="/css/my.css?ver=<?php echo G5_CSS_VER;?>">
<link rel="stylesheet" href="/css/page.css?ver=<?php echo G5_CSS_VER;?>">

<?php 

add_javascript('<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>');
add_javascript('<script src="/plugin/swiper/package/js/swiper.min.js"></script>');
add_javascript('<script src="/plugin/jquery-confirm/jquery-confirm.min.js?ver=<?php echo G5_JS_VER;?>"></script>');

add_javascript('<script src="/js/my.js?ver='.G5_JS_VER.'"></script>');


}?>

</head>
<body<?php echo isset($g5['body_script']) ? $g5['body_script'] : ''; ?> class="<?php echo ((G5_IS_MOBILE)?"mbody":"pbody");?> <?php echo (($is_index)?"index":"");?> <?php echo (($is_board)?"board":"");?>">