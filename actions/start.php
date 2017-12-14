<?php
date_default_timezone_set('America/Mexico_City');
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
    if(isset($_POST['nc'])&&$_POST['nc']){
        $grado_confianza=$_POST['nc'];
        require_once('consulta.php');
        $data=consulta();
        
        if(!empty($data)){
            require_once('generate.php');
            $body=reporte($data);
            if(strcmp($body,"")>0){
                create_rp($body);
                echo $body;
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
}
else{
    echo false;

}
?>