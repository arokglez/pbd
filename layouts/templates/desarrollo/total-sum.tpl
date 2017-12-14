{if $dato@key neq "SUMINISTRO" && $dato@key neq "CALIDAD DE SUEÑO"}
<h4 style="text-align:center">Total de suministro para {$dato@key}</h4>
<table cellpadding="5" cellspacing="0" border="1" style="font-size:12pt; position:relative; margin:0 auto;text-align:center;" width="100%">
            <thead>
                <tr style="color:white;text-align: center; background-color: brown">
                    <td style="font-size:13px; font-weight: bold">
                        SUMINISTRO
                    </td>
                    {foreach $data["sum"][($dato@key)]["SOMNIFERO"] as $tipo}
                    <td style="font-size:13px; font-weight: bold">
                        {$tipo@key|replace:"_":" "}
                    </td>
                    {/foreach}
                </tr>
            </thead>
            <tbody> 
                {$cl_suministro=null}
                {$t_cl_suministro=null}
                {$t_suministro=0}
                {foreach $data["sum"][($dato@key)] as $tipo}
                <tr style="color:black; background-color: white">
                    <td style="text-align:center;font-weight: bold;vertical-align:middle">{$tipo@key|replace:"_":" "}</td>
                    {foreach $tipo as $col}
                    <td style=" text-align:center;vertical-align:middle">
                        {append var='cl_suministro' value=$col}
                        {$col}
                    </td>
                    {/foreach}
                </tr>
                {/foreach}
                <tr style="color:black; background-color: white">
                    {$cols_sum_t=$cl_suministro|@count/2}
                    <td style="font-weight:bold;text-align:center;vertical-align:middle">TOTAL</td> 
                    {for $i=0 to $cols_sum_t-1}
                    <td style="text-align:center;vertical-align:middle">
                        {append var='t_cl_suministro' value=$cl_suministro[$i]+$cl_suministro[$i+$cols_sum_t]}
                        {$t_cl_suministro[$i]}
                    </td>
                    {/for}
                </tr>
            </tbody>
        </table>
        
<br>        
<br>
<div id="container{$container}"></div>
        <script>
        var colors = Highcharts.getOptions().colors,
    categories{$container} = [
    {foreach $data["sum"][($dato@key)]["SOMNIFERO"] as $tipo}
    '{$tipo@key|replace:"_":" "}',
    {/foreach}
    ],
    data{$container} = [
    {for $i=0 to $cols_sum_t-1}
    {
        y: {$t_cl_suministro[$i]},
        color: colors[{$i+3}],
        drilldown: {
            name: 'SUMINISTRO {($data["sum"][($dato@key)]["SOMNIFERO"][$i])|replace:"_":" "}',
            categories: ['PLACEBO', 'SOMNIFERO'],
            data: [{$cl_suministro[$i]},{$cl_suministro[$i+$cols_sum_t]}],
            color: colors[{$i+4}]
        }
    }, 
    {/for}
    
    ],
    categoria{$container} = [],
    clasificacion{$container} = [],
    i,
    j,
    dataLen{$container} = data{$container}.length,
    drillDataLen{$container},
    brightness;

for (i = 0; i < dataLen{$container}; i += 1) {
    categoria{$container}.push({
        name: categories{$container}[i],
        y: data{$container}[i].y,
        color: data{$container}[i].color
    });
    drillDataLen{$container} = data{$container}[i].drilldown.data.length;
    for (j = 0; j < drillDataLen{$container}; j += 1) {
        brightness = 0.2 - (j / drillDataLen{$container}) / 5;
        clasificacion{$container}.push({
            name: data{$container}[i].drilldown.categories[j],
            y: data{$container}[i].drilldown.data[j],
            color: Highcharts.Color(data{$container}[i].color).brighten(brightness).get()
        });
    }
}

// Create the chart
Highcharts.chart('container{$container}', {
    chart: {
        type: 'pie',
        width:900
    },
    title: {
        text: 'Clasificación de las personas por suministro'
    },
    yAxis: {
        title: {
            text: 'Total de suministro'
        }
    },
    plotOptions: {
        pie: {
            shadow: false,
            center: ['50%', '50%']
        }
    },
    tooltip: {
        valueSuffix: ' personas'
    },
    series: [{
        name: 'Categoría',
        data: categoria{$container},
        size: '60%',
        dataLabels: {
            formatter: function () {
                return this.y > 5 ? this.point.name : null;
            },
            color: '#ffffff',
            distance: -30
        }
    }, {
        name: 'Suministro',
        data: clasificacion{$container},
        size: '80%',
        innerSize: '60%',
        dataLabels: {
            formatter: function () {
                // display only if larger than 1
                return this.y > 1 ? '<b>' + this.point.name + ':</b> (' +
                    this.y + ' personas)' : null;
            }
        }
    }]
});
   
        
        </script>
        
        
{assign var=container value=$container+1 scope="global"}       
{/if}