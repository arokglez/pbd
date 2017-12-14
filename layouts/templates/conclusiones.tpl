<h1 style="text-align: center">CONCLUSIONES</h1>


{foreach $conclusiones as $conclusion}
<h3>{$conclusion@key}</h3>
<p style="font-size:12pt;margin-left:2em;text-align:justify">
{$conclusion}
</p>
<br>
{/foreach}