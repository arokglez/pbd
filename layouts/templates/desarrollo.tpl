
<h1 style="text-align: center">DESARROLLO</h1>


{assign var=container value=0 scope="global"}
{foreach $data as $total}
{if $total@key eq "total"}
{include 'desarrollo/totales.tpl'}
{else}
{if $total@key eq "chi"}
{include 'desarrollo/chi.tpl'}
{/if}
{/if}
{/foreach}
