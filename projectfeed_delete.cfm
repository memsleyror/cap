<!---check to see if projectfeed_id ID was provided --->

<cfif NOT IsDefined("projectfeed_id")>
	You did not specify a projectfeed ID.
	<cfabort>
</cfif>

<!---delete projectfeed --->

<cfinvoke component="projectfeed" method="delete" projectfeed_id="#URL.projectfeed_id#">
	
	
<cflocation url="projectfeed.cfm">	