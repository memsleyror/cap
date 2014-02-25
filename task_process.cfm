<!---edit or update --->

<cfif IsDefined("FORM.task_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfparam name="form.roles" default="">

<cfinvoke component="#application.taskService#" method="#method#">

	<!---task ID only if update method --->
	<cfif IsDefined("FORM.task_id")>
		<cfinvokeargument name="task_id" value="#FORM.task_id#">
	</cfif>
	
	<cfinvokeargument name="task_desc" value="#Trim(FORM.task_desc)#">
	<cfinvokeargument name="project_id" value="#Int(FORM.project_id)#">
	<cfinvokeargument name="task_start_date" value="#DateFormat(FORM.task_start_date)#">
	<cfinvokeargument name="task_end_date" value="#DateFormat(FORM.task_end_date)#">
	<cfinvokeargument name="tasktype_id" value="#Int(FORM.tasktype_id)#">
	<cfif structKeyExists(form, "roles")>
		<cfinvokeargument name="roles" value="#form.roles#">
	</cfif>

</cfinvoke>

<cflocation url="tasks.cfm" addToken="false">