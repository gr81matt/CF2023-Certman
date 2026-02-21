<!--- Copyright (c) 2011 Paul Connell <certman@paulconnell.info> --->
<cfinvoke component="KeyStoreManager" method="init" returnvariable="KeyStoreManager">
<cfset CertificateArray = KeyStoreManager.listAll()>

<cfinclude template="../header.cfm">

<h2 class="subheading"> SSL Certificates &gt; Certificate Management</h2>

<p>Certificates listed below are used by tags such as CFHTTP/CFEXCHANGE to access SSL sites.  To access a self-signed SSL site, add the certificate to the keystore.</p>

<form action="addCertForm.cfm" method="get">
	<input type="submit" name="addCert" class="buttn-grey buttn-green" value="Add a New Certificate">
</form>

<cfif isDefined("url.message")>
	<p style="font-size:larger;color:ff0000;"><cfoutput>#url.message#</cfoutput></p>
</cfif>

<hr class="line">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="subheading">
			Certificates
		</td>
	</tr>
	<tr>
		<td>
		
		<table class="main-table">
		<tr class="main-table-header">
			<th scope="col" nowrap>
				<strong> Actions </strong></th>
			<th scope="col" nowrap>				
				<strong> Alias </strong>
			</th>
			<th scope="col" nowrap>				
				<strong> Not Before </strong>
			</th>
			<th scope="col" nowrap>				
				<strong> Not After </strong>
			</th>
			<th scope="col" nowrap>				
				<strong> Common Name </strong>
			</th>
		</tr>
		<cfloop from="1" to="#ArrayLen(CertificateArray)#" step="1" index="i">
		<tr>
				<td nowrap>
					
					<table border="0" cellpadding="2" cellspacing="0" align="center">
					<tr>
						<td align="center">
							<cfoutput>
							<a href="downloadCert.cfm?alias=#encodeForURL(CertificateArray[i][1])#"
							   onmouseover="window.status='Download PEM'; return true;"
							   onmouseout="window.status=''; return true;"
							   title="Download PEM"><img src="/CFIDE/administrator/images/download.png" vspace="2" hspace="2" width="16" height="16" alt="Download PEM" title="Download PEM" border="0"></a>
							<a href="deleteCert.cfm?alias=#encodeForURL(CertificateArray[i][1])#"
							   onmouseover="window.status='Delete Certificate'; return true;"
							   onmouseout="window.status=''; return true;"
							   onclick="return confirm('Are you sure you want to delete this certificate?');"
							   title="Delete Certificate"><img src="/CFIDE/administrator/images/idelete.png" vspace="2" hspace="1" width="16" height="16" alt="Delete Certificate" border="0"></a>
							</cfoutput>
						</td>
					</tr>
					</table>
					
				</td>
				<td nowrap>
					<cfoutput><a href="displayCert.cfm?alias=#encodeForURL(CertificateArray[i][1])#"
					   onmouseover2="window.status='View Certificate Details'; return true;"
					   onmouseout2="window.status='';" title="View Certificate Details">
					   #CertificateArray[i][1]#</a></cfoutput>
				</td>
				<td nowrap>
					<cfoutput>#LSdateformat(CertificateArray[i][2].getNotBefore())#</cfoutput>
				</td>
				<td nowrap <cfif CertificateArray[i][2].getNotAfter() LT Now()>style="color:#ff0000;"</cfif>>
					<cfoutput>#LSdateformat(CertificateArray[i][2].getNotAfter())#</cfoutput>
				</td>
				<td nowrap>
					<cfoutput>#left(CertificateArray[i][2].getCommonName(),80)#</cfoutput>
				</td>
		
			</tr>
			</cfloop>
		</table>
	</tr>
</table>

<hr class="line">

<table class="footer-container">
	<tbody>
	<tr>
		<td style="width: 100%;" colspan="2"><p style="margin:0px 20px 10px 20px; text-align: center;" class="loginCopyrightText">&copy; 1995 - 2023 Adobe. All Rights Reserved. <br></p>
		</td>
	</tr>
	</tbody>
</table>

<cfif isDefined("url.restartreq")>
<script>
	window.alert('For these changes to take effect, you may have to restart the ColdFusion Service.');
</script>
</cfif>