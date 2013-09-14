<!---check to see if version ID was provided --->

<cfif NOT IsDefined("version_id")>
	You did not specify a version ID.
	<cfabort>
</cfif>

<!---delete version --->

<cfinvoke component="versions" method="delete" version_id="#URL.version_id#">
	
	
<cflocation url="versions.cfm">	