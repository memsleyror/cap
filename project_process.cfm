<!---edit or update --->

<cfif IsDefined("FORM.project_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="projects" method="#method#" >

	<!---project ID only if update method --->
	<cfif IsDefined("FORM.project_id")>
		<cfinvokeargument name="project_id" value="#FORM.project_id#">
	</cfif>
	
	<cfinvokeargument name="project_name" value="#Trim(FORM.project_name)#">
	<cfinvokeargument name="project_desc" value="#Trim(FORM.project_desc)#">
	<cfinvokeargument name="project_start_date" value="#DateFormat(FORM.project_start_date)#">
	<cfinvokeargument name="project_end_date" value="#DateFormat(FORM.project_end_date)#">
	<cfinvokeargument name="company_id" value="#Int(FORM.company_id)#">

</cfinvoke>

<cflocation url="projects.cfm" >		 		