<?php
$titular="TECNOLÓGICO DE ESTUDIOS SUPERIORES DE ECATEPEC";

$materia="PROGRAMACIÓN DE BASE DE DATOS";

$trabajo="ANÁLISIS DE HIPOTESÍS CON DISTRIBUCIÓN DE JI(CHÍ)";

$integrantes='<ul>
                <li>GONZÁLEZ ÁNGELES ALFREDO</li>
                <li>HERNANDEZ HUICHAPA IVONNE ESTELA</li>
                <li>MAYA RANGEL ROSALVA</li>
                <li>TORRES HERNANDEZ KARLA CECILIA</li>
            </ul>';

$grupo="5751";

require_once('finish/AGA.php');
require_once('finish/HHIE.php');
require_once('finish/MRR.php');
require_once('finish/THKC.php');

$aga = new AGA();
$hhie = new HHIE();
$mrr = new MRR();
$thkc= new THKC();

$conclusiones=array(
    "GONZÁLEZ ÁNGELES ALFREDO" => $aga->get(),
    "HERNANDEZ HUICHAPA IVONNE ESTELA" => $hhie->get(),
    "MAYA RANGEL ROSALVA" => $mrr->get(),
    "TORRES HERNANDEZ KARLA CECILIA" => $thkc->get()

);


$problematica="¿Qué influye en la calidad del sueño de un paciente con respecto a cada uno de los factores de riesgo que posee?";

$grado_confianza=$GLOBALS["grado_confianza"]/100;

$step=0.001;

$probabilidades=array();

$total=1;

for($i=1;$i>0;$i=$i-$step){
    array_push($probabilidades,$i);
}


$header='<p><img src="../custom/head.png" style="width=1037px; height:180px"/> 
                </p>';

$headerTEXT=array(
        'L' => array(
            'content' => 'TESE',
            'font-size' => 12,
            'font-style' => 'B',
            'font-family' => 'serif',
            'color'=>'#000000'

        ),
        'C' => array(
            'content' => 'Análisis de una base de datos (Distribución chí)',
            'font-size' => 8,
            'font-style' => 'B',
            'font-family' => 'serif',
            'color'=>'#000000'

        ),
        'R' => array(
            'content' => 'Programación de base de datos',
            'font-size' => 8,
            'font-style' => 'B',
            'font-family' => 'serif',
            'color'=>'#000000'

        ),
        'line' => 1
);

$footerbody='<hr style="border-bottom:1px solid black;width:100%"/>
                <span style="text-align:center;">
                LOS DATOS MOSTRADOS EN ESTE REPORTE ES UNICAMENTE CON FINES ILUSTRATIVOS
                </span>
                <table width="100%">
                <tr>
                <td style="text-align:left; font-size:7pt">
                    Fecha:'.date('d/m/Y g:i:s A').'
                </td>
                <td style="text-align:right">
                Pag. {PAGENO} 
                </td>
                </tr>
                </table>';
$footer='<hr style="border-bottom:1px solid black;width:100%"/>
                <span style="text-align:center;">
                LOS DATOS MOSTRADOS EN ESTE REPORTE ES UNICAMENTE CON FINES ILUSTRATIVOS
                </span>
                <table width="100%">
                <tr>
                <td style="text-align:left; font-size:7pt">
                    Fecha:'.date('d/m/Y g:i:s A').'
                </td>
                </tr>
                </table>';
?>