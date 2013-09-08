<!---edit or update --->

<cfif IsDefined("FORM.userproject_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="userproject" method="#method#" >

	<!---project ID only if update method --->
	<cfif IsDefined("FORM.userproject_id")>
		<cfinvokeargument name="userproject_id" value="#FORM.userproject_id#">
	</cfif>
	
	<cfinvokeargument name="user_id" value="#Int(FORM.user_id)#">
	<cfinvokeargument name="project_id" value="#Int(FORM.project_id)#">

</cfinvoke>

<cflocation url="userproject.cfm" >		 		