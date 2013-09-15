



<!---edit or update --->

<cfif IsDefined("FORM.userstakeholdergroup_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="userstakeholdergroup" method="#method#" >

	<!---userstakeholdergroup ID only if update method --->
	<cfif IsDefined("FORM.userstakeholdergroup_id")>
		<cfinvokeargument name="userstakeholdergroup_id" value="#FORM.userstakeholdergroup_id#">
	</cfif>
	
	<cfinvokeargument name="user_id" value="#Int(FORM.user_id)#">
	<cfinvokeargument name="stakeholdergroup_id" value="#Int(FORM.stakeholdergroup_id)#">
	
	

</cfinvoke>

<cflocation url="userstakeholdergroup.cfm" >		 		