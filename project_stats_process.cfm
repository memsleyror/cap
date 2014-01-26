<!---edit or update --->

<cfif IsDefined("FORM.project_stat_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="project_stats" method="#method#" >

	<!---project_stat ID only if update method --->
	<cfif IsDefined("FORM.project_stat_id")>
		<cfinvokeargument name="project_stat_id" value="#FORM.project_stat_id#">
	</cfif>
	
	<cfinvokeargument name="project_stat_name" value="#Trim(FORM.project_stat_name)#">
	<cfinvokeargument name="project_stat_note" value="#Trim(FORM.project_stat_note)#">
	<cfinvokeargument name="project_stat_value" value="#Trim(FORM.project_stat_value)#">
	<cfinvokeargument name="project_stat_style" value="#Trim(FORM.project_stat_style)#">
	<cfinvokeargument name="project_id" value="#Int(FORM.project_id)#">
	
</cfinvoke>

<cflocation url="project_stats.cfm" >		 	