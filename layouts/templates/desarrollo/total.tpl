
{if $dato@key eq "EDAD"}
{include 'desarrollo/edad.tpl'}
{/if}
<table cellpadding="5" cellspacing="0" border="1" style="overflow: wrap;font-size:14px; position:relative; margin:0 auto;" width="100%">
    <thead>
        <tr style="color:white;text-align: center; background-color: brown">
            {foreach $dato as $tipo}
            <td style="font-size:13px; font-weight: bold">
                {$tipo@key|replace:"_":" "}
            </td>
            {/foreach}
        </tr>
    </thead>
    <tbody>
        <tr style="color:black; background-color: white">
            {$t_tipo=0}
            {foreach $dato as $tipo}
            {$t_tipo=$tipo+$t_tipo}
            <td style="text-align: center;">{$tipo}</td>
            {/foreach}
        </tr>
    </tbody>
</table>
<br>
<div id="container{$container}">
</div>
<script>
Highcharts.chart('container{$container}', {
 chart: {
        type: 'variablepie',
        width:900
 },
 title:{
    text:"Agrupación por categoría"
    },
    series:[{
    innerSize: '10%',
    zMin: 0,
    data:[
    {foreach $dato as $tipo}
    {if $tipo@iteration lt $dato|@count}
    {
            name: '{$tipo@key} ({$tipo})',
            y: {$tipo},
            z: {$tipo@iteration}
    },
            {else}
    {
            name: '{$tipo@key} ({$tipo})',
            y: {$tipo},
            z: {$tipo@iteration}
    }
            {/if}
    
    {/foreach}
    ]
    }]

 });
</script>
{assign var=container value=$container+1 scope="global"}

{include 'desarrollo/total-sum.tpl'}

<div style="text-align:center;width:100%;margin:0px auto">
    <b>TOTAL : {$t_tipo}</b>
</div>