<!---check to see if task ID was provided --->

<cfif NOT IsDefined("task_id")>
	You did not specify a task ID.
	<cfabort>
</cfif>

<!---delete task --->

<cfinvoke component="tasks" method="delete" task_id="#URL.task_id#">
	
	
<cflocation url="tasks.cfm">	