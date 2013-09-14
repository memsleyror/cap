<!---check to see if caseforchange_id ID was provided --->

<cfif NOT IsDefined("caseforchange_id")>
	You did not specify a caseforchange ID.
	<cfabort>
</cfif>

<!---delete caseforchange --->

<cfinvoke component="caseforchange" method="delete" caseforchange_id="#URL.caseforchange_id#">
	
	
<cflocation url="caseforchange.cfm">	