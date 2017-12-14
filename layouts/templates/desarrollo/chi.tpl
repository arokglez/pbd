<div class="totales">
    <div style="width:100%;margin:0px auto;text-align:center;">
        <h2>Análisis de las hipótesis para cada característica</h2>
        <hr style="width:50%; border-top:1px solid gray"/>
    </div>

    {foreach $total as $dato}
        <div style="width:100%;margin:0px auto;text-align:left">
            <h3 style="text-align:center">{$dato@key}</h3>
            <hr style="width:15%; border-top:1px solid gray"/>
            {include 'desarrollo/chi-i.tpl'}
        </div>
    
    <pagebreak>
    {/foreach}
</div>