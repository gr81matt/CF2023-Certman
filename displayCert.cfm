<!--- Copyright (c) 2011 Paul Connell <certman@paulconnell.info> --->
<cfinclude template="../header.cfm">

<cfinvoke component="KeyStoreManager" method="init" returnvariable="KeyStoreManager">

<cfset Certificate = KeyStoreManager.read(decodeFromURL(url.alias))>

<h2 class="subheading"> SSL Certificates &gt; Certificate Management &gt; Certificate &quot;<cfoutput>#url.alias#</cfoutput>&quot;</h2>

<form action="index.cfm" method="get">
	<input type="submit" name="back" class="buttn-grey buttn-green" value="Back to Certificate List">
</form>

<hr class="line">
<cfoutput><pre>#Wrap(Certificate.asString(),155)#</pre></cfoutput>

<hr class="line">

<form action="index.cfm" method="get">
	<input type="submit" name="back" class="buttn-grey buttn-green" value="Back to Certificate List">
</form>

<hr class="line">

<table class="footer-container">
	<tbody>
	<tr>
		<td style="width: 100%;" colspan="2"><p style="margin:0px 20px 10px 20px; text-align: center;" class="loginCopyrightText">&copy; 1995 - 2023 Adobe. All Rights Reserved. <br></p>
		</td>
	</tr>
	</tbody>
</table>