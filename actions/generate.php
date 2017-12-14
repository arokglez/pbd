<?php
function create_rp($body){
    $page='
    <doctype html>
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="custom/js/jquerymin.js" ></script>
        <script src="custom/js/bootstrap.min.js" ></script>
        <script src="libs/highcharts/highcharts.js"></script>
        <script src="libs/highcharts/modules/variable-pie.js"></script>
        <link rel="stylesheet" href="custom/css/bootstrap.min.css">
    </head>
    <body>
    <div class="section">
    <div class="container-fluid">
    <div class="col-xs-12">
    ';
    $page.=$body;
    $page.='
    </div>
    </div>
    </div>
    </body>
            </html>
            ';
    $archivo_n="../debug.html";
    file_exists($archivo_n);
    $archivo = fopen($archivo_n, "w");
    fwrite($archivo,$page);
    fclose($archivo);
    
}
function reporte($data){
    if (function_exists('mb_internal_charset')) {
  mb_internal_charset('UTF-8');
    }
    define('SMARTY_RESOURCE_CHAR_SET', 'UTF-8');
    require_once('../libs/vendor/autoload.php');
    require_once('../libs/vars.php');
    $smarty = new Smarty();
    $smarty->setTemplateDir('../layouts/templates');
    
    $smarty->assign('problematica',$problematica);
    $smarty->assign('conclusiones',$conclusiones);
    $smarty->assign('prb',$probabilidades);
    $smarty->assign('grado_confianza',$grado_confianza);
    $smarty->assign('data',$data);
    $body='';
    $body=$smarty->fetch('reporte.tpl');
    if(strcmp($body,"")>0){
        return $body;
    }
    else{
        return false;
    }
}

?>