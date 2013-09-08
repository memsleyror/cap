<!---edit or update --->

<cfif IsDefined("FORM.role_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="roles" method="#method#" >

	<!---role ID only if update method --->
	<cfif IsDefined("FORM.role_id")>
		<cfinvokeargument name="role_id" value="#FORM.role_id#">
	</cfif>
	
	<cfinvokeargument name="role_name" value="#Trim(FORM.role_name)#">
	<cfinvokeargument name="role_desc" value="#Trim(FORM.role_desc)#">
	
</cfinvoke>

<cflocation url="roles.cfm" >		 	