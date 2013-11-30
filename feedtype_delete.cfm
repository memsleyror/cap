<!---check to see if feedtype ID was provided --->

<cfif NOT IsDefined("feedtype_id")>
	You did not specify a feedtype ID.
	<cfabort>
</cfif>

<!---delete feedtype --->

<cfinvoke component="feedtypes" method="delete" feedtype_id="#URL.feedtype_id#">
	
	
<cflocation url="feedtypes.cfm">	