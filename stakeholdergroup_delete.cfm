<!---check to see if stakeholdergroup ID was provided --->

<cfif NOT IsDefined("stakeholdergroup_id")>
	You did not specify a stakeholdergroup ID.
	<cfabort>
</cfif>

<!---delete stakeholdergroup --->

<cfinvoke component="stakeholdergroups" method="delete" stakeholdergroup_id="#URL.stakeholdergroup_id#">
	
	
<cflocation url="stakeholdergroups.cfm">	