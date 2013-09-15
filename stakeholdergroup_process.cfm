<!---edit or update --->

<cfif IsDefined("FORM.stakeholdergroup_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="stakeholdergroups" method="#method#" >

	<!---stakeholdergroup ID only if update method --->
	<cfif IsDefined("FORM.stakeholdergroup_id")>
		<cfinvokeargument name="stakeholdergroup_id" value="#FORM.stakeholdergroup_id#">
	</cfif>
	
	<cfinvokeargument name="stakeholdergroup_name" value="#Trim(FORM.stakeholdergroup_name)#">
	<cfinvokeargument name="stakeholdergroup_desc" value="#Trim(FORM.stakeholdergroup_desc)#">
	<cfinvokeargument name="stakeholdergroup_size" value="#Trim(FORM.stakeholdergroup_size)#">
	<cfinvokeargument name="company_id" value="#Int(FORM.company_id)#">

</cfinvoke>

<cflocation url="stakeholdergroups.cfm" >		 		