<!---check to see if userstakeholdergroup_id ID was provided --->

<cfif NOT IsDefined("userstakeholdergroup_id")>
	You did not specify a userstakeholdergroup ID.
	<cfabort>
</cfif>

<!---delete userstakeholdergroup --->

<cfinvoke component="userstakeholdergroup" method="delete" userstakeholdergroup_id="#URL.userstakeholdergroup_id#">
	
	
<cflocation url="userstakeholdergroup.cfm">	