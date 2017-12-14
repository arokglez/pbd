<?php
date_default_timezone_set('America/Mexico_City');
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
    if(isset($_POST['body'])){
        if(file_exists('../reporte.pdf')) unlink('../reporte.pdf');
        require_once('../libs/vendor/autoload.php');
        //$highchartcss = '<style> '.file_get_contents('../libs/highcharts/css/highcharts.css').'</style>';
        $body='<body>'.$_POST['body'].'</body>';
        $body=str_replace('  ','',$body);
        //$myfile = fopen("page.html", "w") or die("Unable to open file!");
        //fwrite($myfile, $body);

        if (function_exists('mb_internal_charset')) {
            mb_internal_charset('UTF-8');
        }
        define('SMARTY_RESOURCE_CHAR_SET', 'UTF-8');
        require_once('../libs/vars.php');
        $smarty = new Smarty();
        $smarty->setTemplateDir('../layouts/templates');
        $smarty->assign('titular',$titular);
        $smarty->assign('materia',$materia);
        $smarty->assign('trabajo',$trabajo);
        $smarty->assign('grupo',$grupo);
        $smarty->assign('integrantes',$integrantes);
        $portada=$smarty->fetch('portada.tpl');



        $mpdf = new \Mpdf\Mpdf([
            'mode' => 'utf-8',
            'setAutoTopMargin' => 'pad',
            'format' => 'Letter',
            'Orientation' => 'L',
            'default_font' => 'dejavusans',
            'default_font_size' => 10
        ]);

        $mpdf->SetTitle("reporte");
        $mpdf->WriteHTML($portada);
        //$mpdf->SetHTMLHeader($header,'O',false);
        $mpdf->SetHeader($headerTEXT,'O');
        $mpdf->h2bookmarks = array('H1'=>0, 'H2'=>1, 'H3'=>2, 'H4'=>3);
        $mpdf->h2toc = array('H1' => 0, 'H2' => 1, 'H3' => 2, 'H4' => 3);
        $mpdf->TOCpagebreakByArray(
            array(
                'tocfont' => '',
                'tocfontsize' => '',
                'tocindent' => '',
                'TOCusePaging' => true,
                'TOCuseLinking' => 'true',
                'toc_orientation' => '',
                'toc_mgl' => '',
                'toc_mgr' => '',
                'toc_mgt' => '10',
                'toc_mgb' => '30',
                'toc_mgh' => '',
                'toc_mgf' => '',
                'toc_ohname' => '',
                'toc_ehname' => '',
                'toc_ofname' => '',
                'toc_efname' => '',
                'toc_ohvalue' => 0,
                'toc_ehvalue' => 0,
                'toc_ofvalue' => 0,
                'toc_efvalue' => 0,
                'toc_preHTML' => '<h1 style="text-align:center;padding-top:25px">INDICE</h1>',
                'toc_postHTML' => '',
                'toc_bookmarkText' => 'INDICE',
                'resetpagenum' => 4,
                'pagenumstyle' => '1',
                'suppress' => 0,
                'orientation' => '',
                'mgl' => '',
                'mgr' => '',
                'mgt' => '10',
                'mgb' => '30',
                'mgh' => '',
                'mgf' => '',
                'ohname' => '',
                'ehname' => '',
                'ofname' => '',
                'efname' => '',
                'ohvalue' => 0,
                'ehvalue' => 0,
                'ofvalue' => 0,
                'efvalue' => 0,
                'toc_id' => 0,
                'pagesel' => '',
                'toc_pagesel' => '',
                'sheetsize' => '',
                'toc_sheetsize' => ''
            ));
        //$mpdf->SetHTMLFooter($footer,'0',false);
        //$mpdf->WriteHTML('');
        $mpdf->SetHTMLFooter($footerbody,'0',false);
        $mpdf->WriteHTML($body);
        

        $mpdf->Output('../reporte.pdf');


        if(file_exists('../reporte.pdf')){
            echo true;
        }
        else{
            echo false;
        }
    }
    else{
        echo false;
    }
}
else{
    echo false;
}
?>

