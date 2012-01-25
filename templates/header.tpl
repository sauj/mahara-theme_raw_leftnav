<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

{include file="header/head.tpl"}
<body>
{if $USERMASQUERADING}<div class="sitemessage"><img src="{theme_url filename='images/icon_problem.gif'}" alt="" />{$masqueradedetails} {$becomeyouagain|safe}</div>{/if}
{if $SITECLOSED}<div class="sitemessage center">{if $SITECLOSED == 'logindisabled'}{str tag=siteclosedlogindisabled section=mahara arg1="`$WWWROOT`admin/upgrade.php"}{else}{str tag=siteclosed}{/if}</div>{/if}
<div id="container">
    {if $SITETOP}{$SITETOP|safe}{/if}
    <div id="loading-box"></div>
    <div id="top-wrapper">
    	<h1 id="site-logo"><a href="{$WWWROOT}"><img src="{theme_url filename='images/site-logo.png'}" alt="{$sitename}"></a></h1>
{include file="header/topright.tpl"}
{include file="header/navigation.tpl"}
		
		<div class="cb"></div>
    </div>
    <div id="main-wrapper">
    			{if $SELECTEDSUBNAV || ($SIDEBARS && $SIDEBLOCKS.left)}
                <div id="left-column" class="sidebar">
{include file="sidebar.tpl" blocks=$SIDEBLOCKS.left}
                    <div id="sb-navigation" class="sideblock sideblock-1">
                        <div class="sidebar-header">
                            <h3>Navigation</h3>
                        </div>
                        <div class="sidebar-content">
                            <div id="sub-nav-left">
                                <ul>{strip}
                                {foreach from=$SELECTEDSUBNAV item=item}
                                	<li{if $item.selected} class="selected"{/if}><a href="{$WWWROOT}{$item.url}"{if $item.accesskey} accesskey="{$item.accesskey}"{/if}>{$item.title}</a></li>
                				{/foreach}
                                {/strip}</ul>
                            </div>
                            
                            {if !$nosearch && $LOGGEDIN}<div id="user-search">{user_search_form}</div>{/if}
                        </div>
                    </div>
                </div>
                {/if}
                <div id="main-column" class="main-column {if $SELECTEDSUBNAV && $SIDEBLOCKS.right} main-column-narrow{else} main-column-wide{/if} fl">
                     {dynamic}{insert_messages}{/dynamic}
                    <div id="main-column-container">

{if isset($PAGEHEADING)}                    <h1>{$PAGEHEADING}{if $PAGEHELPNAME}<span class="page-help-icon">{$PAGEHELPICON|safe}</span>{/if}</h1>
{/if}

{if $SUBPAGENAV}
  {if $SUBPAGETOP}{include file=$SUBPAGETOP}{/if}
{* Tabs and beginning of page container for group info pages *}                        <ul class="in-page-tabs">
{foreach from=$SUBPAGENAV item=item}
                            <li><a {if $item.selected}class="current-tab" {/if}href="{$WWWROOT}{$item.url}">{$item.title}</a></li>
{/foreach}
                        </ul>
                        <div class="subpage rel">
{/if}
