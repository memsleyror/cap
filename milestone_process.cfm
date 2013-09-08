<!---edit or update --->

<cfif IsDefined("FORM.milestone_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="milestones" method="#method#" >

	<!---user ID only if update method --->
	<cfif IsDefined("FORM.milestone_id")>
		<cfinvokeargument name="milestone_id" value="#FORM.milestone_id#">
	</cfif>
	
	<cfinvokeargument name="milestone_name" value="#Trim(FORM.milestone_name)#">
	<cfinvokeargument name="milestone_desc" value="#Trim(FORM.milestone_desc)#">
	<cfinvokeargument name="milestone_date" value="#DateFormat(FORM.milestone_date)#">
	<cfinvokeargument name="project_id" value="#Int(FORM.project_id)#">
	
	
	
</cfinvoke>

<cflocation url="milestones.cfm" >		 	