<!---edit or update --->

<cfif IsDefined("FORM.team_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="teams" method="#method#" >

	<!---team ID only if update method --->
	<cfif IsDefined("FORM.team_id")>
		<cfinvokeargument name="team_id" value="#FORM.team_id#">
	</cfif>
	
	<cfinvokeargument name="team_name" value="#Trim(FORM.team_name)#">
	<cfinvokeargument name="team_desc" value="#Trim(FORM.team_desc)#">
	<cfinvokeargument name="team_size" value="#Trim(FORM.team_size)#">
	<cfinvokeargument name="company_id" value="#Int(FORM.company_id)#">

</cfinvoke>

<cflocation url="teams.cfm" >		 		