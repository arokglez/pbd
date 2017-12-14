<div class="totales">
    <div style="width:100%;text-align:center;">
        <h2>Total de personas por característica</h2>
        <hr style="width:50%; border-top:1px solid gray"/>
    </div>
    {foreach $total as $dato}
    <div>
        <h3 style="text-align:center">{$dato@key}</h3>
        <hr style="width:15%; border-top:1px solid gray"/>
        <br>
        <br>
        {include 'desarrollo/total.tpl'}
    </div>
    <pagebreak>
    {/foreach}
</div>