<div style="width:100%">
<b>Conjunto de datos edad personas: </b>{
{foreach $data["EDAD_XY"]["DATOS"] as $row}
{if $row@iteration lt $data["EDAD_XY"]["DATOS"]|@count}
{$row.edad|cat:", "}
{else}
{$row.edad}
{/if}
{/foreach}
}
</div>
<br>
<table cellpadding="10" cellspacing="0" border="1" style="overflow: wrap;font-size:14px; position:relative; margin:0 auto" width="50%">
    <thead>
        <tr style="color:white;text-align: center; background-color: brown">
            <td style="font-size:15px; font-weight: bold">
                DESVIACIÓN ESTANDAR
            </td>
            <td style="font-size:15px; font-weight: bold">
                MEDIA
            </td>
        </tr>
    </thead>
    <tbody>
        <tr style="color:black; background-color: white">
            <td style="text-align: center;">{$data["EDAD_XY"]["DESV_MEDIA"].DESVIACION}</td>
            <td style="text-align: center;">{$data["EDAD_XY"]["DESV_MEDIA"].MEDIA}</td>
        </tr>
    </tbody>
</table>
<br>
<div id="container{$container}">
</div>
<script>

Highcharts.chart('container{$container}', {
    chart:{
    width: 800
    },
    title: {
        text: 'Agrupación de edad'
    },
    xAxis: {
        min:0,
        gridLineWidth: 2,
        tickInterval: 1
    
    },
    yAxis: {
        title: {
            text: 'Edad'
        },
        tickInterval: 5,
        plotLines: [{
            color: 'orange', 
            zIndex:1,
            dashStyle: 'DashDot', 
            value: {($data["EDAD_XY"]["DESV_MEDIA"].MEDIA)|round}, 
            width: 2,
            label:
                {
                text:"Media ({$data["EDAD_XY"]["DESV_MEDIA"].MEDIA|round})",
                style: {
                    fontSize:'10px',
                    fontWeight: 'bold'
                }
                }
          },
          {
            color: 'red', 
            zIndex:1,
            dashStyle: 'DashDot', 
            value: {($data["EDAD_XY"]["DESV_MEDIA"].MEDIA+$data["EDAD_XY"]["DESV_MEDIA"].DESVIACION)|round}, 
            width: 2,
            label:
                {
                text:"ADULTO MAYOR (EDAD>={($data["EDAD_XY"]["DESV_MEDIA"].MEDIA+$data["EDAD_XY"]["DESV_MEDIA"].DESVIACION)|round})",
                style: {
                    fontSize:'10px',
                    fontWeight: 'bold'
                }
                }
          },
          {
            zIndex:1,
            color: 'green', 
            dashStyle: 'DashDot', 
            value: {($data["EDAD_XY"]["DESV_MEDIA"].MEDIA-$data["EDAD_XY"]["DESV_MEDIA"].DESVIACION)|round}, 
            width: 2,
            label:
                {
                text:"JOVEN (EDAD<={($data["EDAD_XY"]["DESV_MEDIA"].MEDIA-$data["EDAD_XY"]["DESV_MEDIA"].DESVIACION)|round})",
                y: 10,
                style: {
                    fontSize:'10px',
                    fontWeight: 'bold'
                }
                }
          }]
    },
    labels: {
        items: [
        {
            html: '<b>Adulto</b>',
            style: {
                left: '100%',
                top: '160%'
            }
        },{
            html: '<b>Adulto</b>',
            style: {
                left: '100%',
                top: '100%'
            }
        }]
    },
    series: [{
        name: 'Persona',
        type: 'scatter',
        data: [{foreach $data["EDAD_XY"]["DATOS"] as $row}
        {if $row@iteration lt $data["EDAD_XY"]["DATOS"]|@count}
            [{$row@iteration},{$row.edad}],
            {else}
            [{$row@iteration},{$row.edad}]
            {/if}
        {/foreach}],
        marker: {
            radius: 2.5
        }  
    }]
});
</script>
{assign var=container value=$container+1 scope="global"}
<br>
<br>