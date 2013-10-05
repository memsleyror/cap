<!---edit or update --->

<cfif IsDefined("FORM.user_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="users" method="#method#" >

	<!---user ID only if update method --->
	<cfif IsDefined("FORM.user_id")>
		<cfinvokeargument name="user_id" value="#FORM.user_id#">
	</cfif>
	
	<cfinvokeargument name="user_login" value="#Trim(FORM.user_login)#">
	<cfinvokeargument name="user_password" value="#Trim(FORM.user_password)#">
	<cfinvokeargument name="user_firstname" value="#Trim(FORM.user_firstname)#">
	<cfinvokeargument name="user_lastname" value="#Trim(FORM.user_lastname)#">
	<cfinvokeargument name="user_email" value="#Trim(FORM.user_email)#">
	<cfinvokeargument name="role_id" value="#Int(FORM.role_id)#">
	<!--- <cfinvokeargument name="user_default_project_id" value="#Int(FORM.user_default_project_id)#">--->
	
	
</cfinvoke>

<cflocation url="users.cfm" >		 	