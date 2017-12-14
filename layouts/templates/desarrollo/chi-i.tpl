
        <h4><b>Paso 1:</b> <span>Tabla de datos</span></h4>
        <table cellpadding="5" cellspacing="0" border="1" style="font-size:12pt; position:relative; margin:0 auto;text-align:center;" width="100%">
            <thead>
                <tr style="color:white;text-align: center; background-color: brown">
                    <td style="font-size:13px; font-weight: bold">
                        CALIDAD DE SUEÑO
                    </td>
                    {foreach $dato as $tipo}
                    {foreach $tipo as $col}
                    {foreach $col as $cell}
                    <td style="font-size:13px; font-weight: bold">
                        {$cell@key|replace:"_":" "} / ({$col@key|replace:"_":" "})
                    </td>
                    {/foreach}
                    {/foreach}
                    {break}
                    {/foreach}
                    <td style="font-size:13px; font-weight: bold">
                        TOTAL
                    </td>
                </tr>
            </thead>
            <tbody> 
                {$totals_rs=null}
                {$totals_cls=null}
                {$total_cls=null}
                {$cols_t=0}
                {foreach $dato as $tipo}
                <tr style="color:black; background-color: white">
                    <td style="text-align:center;font-weight: bold;vertical-align:middle">{$tipo@key|replace:"_":" "}</td>
                    {$t_row=0}
                    {foreach $tipo as $col}
                    {foreach $col as $cell}
                    {$t_row=$cell+$t_row}
                    <td style=" text-align:center;vertical-align:middle">
                        {append var='totals_cls' value=$cell}
                        {$cell}
                    </td>
                    {/foreach}
                    {/foreach}
                    {append var='totals_rs' value=$t_row}
                    <td style="text-align:center;vertical-align:middle">
                        {$t_row}
                    </td>
                </tr>
                {/foreach}
                <tr style="color:black; background-color: white">
                    {$cols_t=$totals_cls|@count/2}
                    <td style="font-weight:bold;text-align:center;vertical-align:middle">TOTAL</td> 
                    {$total_f_t=0}
                    {for $i=0 to $cols_t-1}
                    <td style="text-align:center;vertical-align:middle">
                        {append var='total_cls' value=$totals_cls[$i]+$totals_cls[$i+$cols_t]}
                        {$total_f_t=$total_cls[$i]+$total_f_t}
                        {$total_cls[$i]}
                    </td>
                    {/for}
                    <td style="text-align:center;vertical-align:middle">
                        {$total_f_t}
                    </td>
                </tr>
            </tbody>
        </table>
        <br>
        <br>
        <h4><b>Paso 2:</b> Planteamiento de las hipótesis</h4>
        {$h1="H1: La calidad del sueño depende de "|cat:($dato@key|lower)|cat:" de la persona y del suministro"}
        {$h0="H0: La calidad del sueño es independiente de "|cat:($dato@key|lower)|cat:" de la persona y del suministro"}
        <ul>
            <li style="padding-left:10px"><b></b>"{$h1}"</li>
            <li style="padding-left:10px"><b></b>"{$h0}"</li>
        </ul>
        <br>
        <br>
        <h4><b>Paso 3:</b> Calcular las frecuencias esperadas para cada caso</h4>
            <p><b>FORMULA: [ (tC*tF)/T ]</b>
                <br>
                Donde: 
            </p>
            <ul>
                <li style="padding-left:10px"><b>tC </b>= Total de columna</li>
                <li style="padding-left:10px"><b>tF </b>= Total de fila</li>
                <li style="padding-left:10px"><b>T </b>= Total de la población</li>
            </ul>

            <table  cellpadding="10" cellspacing="0" border="1" style="font-size:14px; position:relative; margin:0 auto" width="100%">
                <thead>
                    <tr style="color:white;text-align: center; background-color: brown">
                        <td style="font-size:14px; font-weight: bold">
                            CALIDAD DE SUEÑO
                        </td>
                        {foreach $dato as $tipo}
                        {foreach $tipo as $col}
                        {foreach $col as $cell}
                        <td style="font-size:14px; font-weight: bold">
                            {$cell@key|replace:"_":" "} / ({$col@key|replace:"_":" "})
                        </td>
                        {/foreach}
                        {/foreach}
                        {break}
                        {/foreach}
                        <td style="font-size:14px; font-weight: bold">
                            TOTAL
                        </td>
                    </tr>
                </thead>
                <tbody>
                    {$frec_cls=null}
                    {foreach $dato as $tipo}
                    <tr style="color:black; background-color: white">
                        <td style="text-align:center;font-weight: bold;vertical-align:middle">{$tipo@key|replace:"_":" "}</td>
                        {foreach $total_cls as $t_c}
                        <td style="font-size:15px; text-align:center;vertical-align:middle">
                            {$frec_cell=(($t_c*$totals_rs[$tipo@iteration-1])/$total_f_t)|round:"1"}
                            {append var='frec_cls' value=$frec_cell}
                            {$frec_cell}
                        </td>
                        {/foreach}
                        <td style="font-size:15px; text-align:center;vertical-align:middle">
                            {$totals_rs[$tipo@iteration-1]}
                        </td>
                    </tr>
                    {/foreach}
                    <tr style="color:black; background-color: white">
                        <td style="font-size:15px;font-weight:bold;text-align:center;vertical-align:middle">TOTAL</td> 
                        {foreach $total_cls as $t_c}
                        <td style="font-size:15px; text-align:center;vertical-align:middle">
                            {$t_c}
                        </td>
                        {/foreach}
                        <td style="font-size:15px; text-align:center;vertical-align:middle">
                            {$total_f_t}
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <br>
            <br>
            <h4><b>Paso 4:</b> Calcular el estadístico de prueba " X² " (CHI/JI CUADRADA)</h4>

            <p><b>FORMULA: X² = <span style="font-size:15px"> { [ ( o¡ - e¡ )² ] / e¡ } </span></b>
                <br>
                Donde:
            <ul>
                <li style="padding-left:10px"><b>o¡ </b>= Frecuencia observada</li>
                <li style="padding-left:10px"><b>e¡ </b>= Frecuencia esperada</li>
            </ul>
            <br>
            </p>

            <p><b>Por lo tanto:</b></p>
            <table border="0" width="100%">

                <tr>
                    <td style="padding-right:15px;padding-bottom:15px"><b> X²= </b></td>
                    <td style="padding-bottom:15px">
                        {
                        {$chi=0}
                        {foreach $totals_cls as $t_c}
                        {if $t_c@iteration lt $totals_cls|@count}
                        ([({$t_c}-{$frec_cls[$t_c@iteration-1]})²]/{$frec_cls[$t_c@iteration-1]}) <b>+</b> 
                        {else}
                        ([({$t_c}-{$frec_cls[$t_c@iteration-1]})²]/{$frec_cls[$t_c@iteration-1]})
                        {/if}
                        {math assign="chi_t" equation="((pow(x,2))/y)" x=($t_c-$frec_cls[$t_c@iteration-1]) y=$frec_cls[$t_c@iteration-1]}
                        {$chi=$chi+$chi_t}
                        {/foreach}
                        }
                    </td>
                </tr>

                <tr>
                    <td style="padding-right:15px;padding-bottom:15px"><b> X²= </b></td>
                    <td style="padding-bottom:15px">
                        {
                        {foreach $totals_cls as $t_c}
                        {if $t_c@iteration lt $totals_cls|@count}
                        ([({$t_c-$frec_cls[$t_c@iteration-1]})²]/{$frec_cls[$t_c@iteration-1]}) <b>+</b>  
                        {else}
                        ([({$t_c-$frec_cls[$t_c@iteration-1]})²]/{$frec_cls[$t_c@iteration-1]})
                        {/if}
                        {/foreach}
                        }
                    </td>
                </tr>

                <tr>
                    <td style="padding-right:15px;padding-bottom:15px"><b> X²= </b></td>
                    <td style="padding-bottom:15px">
                        {
                        {foreach $totals_cls as $t_c}
                        {if $t_c@iteration lt $totals_cls|@count}
                        ([{math equation="pow(x,2) " x=($t_c-$frec_cls[$t_c@iteration-1])}]/{$frec_cls[$t_c@iteration-1]}) <b>+</b>  
                        {else}
                        ([{math equation="pow(x,2) " x=($t_c-$frec_cls[$t_c@iteration-1])}]/{$frec_cls[$t_c@iteration-1]})
                        {/if}
                        {/foreach}
                        }
                    </td>
                </tr>

                <tr>
                    <td style="padding-right:15px;padding-bottom:15px"><b> X²= </b></td>
                    <td style="padding-bottom:15px">
                        {
                        {foreach $totals_cls as $t_c}
                        {if $t_c@iteration lt $totals_cls|@count}
                        ({math equation="(pow(x,2))/y "   x=($t_c-$frec_cls[$t_c@iteration-1]) y=$frec_cls[$t_c@iteration-1]}) <b>+</b> 
                        {else}
                        ({math equation="(pow(x,2))/y "   x=($t_c-$frec_cls[$t_c@iteration-1]) y=$frec_cls[$t_c@iteration-1]}) 
                        {/if}
                        {/foreach}
                        }
                    </td>
                </tr>

            </table>
            <p><b>X² = </b><span style="border-right:2px solid red; border-bottom:2px solid red;">{$chi|round:"2"}</span></p>

            <br>
            <br>
            <h4><b>Paso 5:</b> Calcular grados de libertad " gl " </h4>
            <p><b>FORMULA: gl = (r-1)x(k-1)  para k > 0</b>
                <br>
                Donde:
            <ul>
                <li style="padding-left:10px"><b>r </b>= Numero de filas sin considerar la de totales</li>
                <li style="padding-left:10px"><b>k </b>= Numero de columnas sin considerar la de totales</li>
            </ul>
            <br>
            </p>
        <p><b>gl = </b>({$totals_rs|@count}-1)*({$total_cls|@count}-1) = <span style="border-right:2px solid red; border-bottom:2px solid red;">
            {$gl=($total_cls|@count-1)*($totals_rs|@count-1)}
            {$gl}
            </span></p>

        <br>
        <br>
        <h4><b>Paso 6:</b> Definir nivel de confianza " &#945; " (alfa) </h4>
        <p> El nivel de confianza permite conocer con la dependencia de las variables con respecto a la estadística de prueba, así que asignaremos un nivel de confianza de <b>{$grado_confianza*100}%</b> por lo que del lado izquierdo será el area de "HO" Y del lado derecho será "H1" con respecto al nivel de confianza para los N grados de libertad. 
        </p>
        <br>
        <br>
        <h4><b>Paso 7:</b>Generar la gráfica de funcion de densidad de chí</h4>

        <p><b>cordenada en x=</b> DISTRIBUCION CHI CUADRADA INVERSA PARA p({$grado_confianza}) x= <span style="border-right:2px solid red; border-bottom:2px solid red;">
            {$nc=stats_cdf_chisquare((1-$grado_confianza),$gl,2)}
            {$nc|round:"4"}
            </span></p>
        <br>
        <div id="container{$container}" >
        </div>
        <script>
            Highcharts.chart('container{$container}', {
                chart: {
                    type: 'area',
                    width: 900
    
                },
                title: {
                    text: 'GRÁFICA DE FUNCION DE DENSIDAD DE PROBABILIDAD CHÍ PARA {$gl} GRADOS DE LIBERTAD'
                },
                xAxis:{
                    plotLines: [{
                        color: 'black', 
                        zIndex:5,
                        dashStyle: 'Dash', 
                        value: {$chi}, 
                        width: 2,
                        label:
                        {
                            text:"Estadístico ( X² = {$chi|round:'3'})",
                            style: {
                                fontWeight: 'bold'
                            }
                        }
                    },
                                {
                                    color: 'red', 
                                    zIndex:5,
                                    value: {$nc}, 
                                    width: 2,
                                    label:
                                    {
                                        text:"Nivel de confianza ({$nc|round:'3'})",
                                        style: {
                                            fontWeight: 'bold'
                                        }
                                    }
                                }]
                },
                yAxis: {
                    title:{
                        text:"p(X) DENSIDAD DE PROBABILIDAD DE X"
                    }
                },
                series: [
                    {$xant=0}
                    {$yant=0}
                    {assign var=series value=1 scope="global"}
                    {for $i=1 to 2}
                    {   zIndex:0,
                    name:'H{$i-1}',
                    color:Highcharts.getOptions().colors[{$i*5}],
                dataLabels: {
                    enabled: false
                },
                data: [

                    {if $yant gt 0}
                    [{$nc},{$yant}]
                    {/if}
                    {if $i eq 1}
                    {$x=stats_cdf_chisquare((1-$prb[0]),{$gl},2)}
            {$gama=stats_stat_factorial(($gl/2)-1)}
            {math assign="y" equation="((pow(x,((k/2)-1)))*(exp(-(x/2))))/(pow(2,(k/2))*gm)" x=$x k=$gl gm=$gama}
            [{$x},{$y}]
            {/if}
             {foreach $prb as $p}
             {if $series eq $prb|@count}
             {break}
             {/if}
              {$x=stats_cdf_chisquare((1-$prb[$series]),{$gl},2)}

              {if $x gt $nc && $xant lt $nc}
              {$gama=stats_stat_factorial(($gl/2)-1)}
              {math assign="yant" equation="((pow(x,((k/2)-1)))*(exp(-(x/2))))/(pow(2,(k/2))*gm)" x=$nc k=$gl gm=$gama}
              ,[{$nc},{$yant}]
              {$xant=$nc}
              {break}
              {elseif $x eq $nc && $xant lt $nc}
              {$gama=stats_stat_factorial(($gl/2)-1)}
              {math assign="yant" equation="((pow(x,((k/2)-1)))*(exp(-(x/2))))/(pow(2,(k/2))*gm)" x=$nc k=$gl gm=$gama}
              ,[{$nc},{$yant}]
              {$xant=$nc}
              {assign var=series value=$series+1 scope="global"}
              {break}
              {/if}

               {$gama=stats_stat_factorial(($gl/2)-1)}
               {math assign="y" equation="((pow(x,((k/2)-1)))*(exp(-(x/2))))/(pow(2,(k/2))*gm)" x=$x k=$gl gm=$gama}
               ,[{$x},{$y}]
               {$xant=$x}
               {assign var=series value=$series+1 scope="global"}
               {/foreach}
                ]

               },
                   {/for}
                    ]
                   });

        </script>
        <br>
        <b>
        <p>Se demuestra que la hipotesis valida es:</p>
        <p style="text-align:center;"><i>"
            {if $nc gt $chi}
            {$h0}
            {else}
            {$h1}
            {/if}
            "</i><p></b>
        {assign var=container value=$container+1 scope="global"}