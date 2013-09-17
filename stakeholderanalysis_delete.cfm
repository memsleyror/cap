<!---check to see if stakeholderanalysis_id ID was provided --->

<cfif NOT IsDefined("stakeholderanalysis_id")>
	You did not specify a stakeholderanalysis ID.
	<cfabort>
</cfif>

<!---delete stakeholderanalysis --->

<cfinvoke component="stakeholderanalysis" method="delete" stakeholderanalysis_id="#URL.stakeholderanalysis_id#">
	
	
<cflocation url="stakeholderanalysis.cfm">	