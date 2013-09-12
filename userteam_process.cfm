



<!---edit or update --->

<cfif IsDefined("FORM.userteam_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="userteam" method="#method#" >

	<!---userteam ID only if update method --->
	<cfif IsDefined("FORM.userteam_id")>
		<cfinvokeargument name="userteam_id" value="#FORM.userteam_id#">
	</cfif>
	
	<cfinvokeargument name="user_id" value="#Int(FORM.user_id)#">
	<cfinvokeargument name="team_id" value="#Int(FORM.team_id)#">
	
	

</cfinvoke>

<cflocation url="userteam.cfm" >		 		