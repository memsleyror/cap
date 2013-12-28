<!---check to see if tasktype ID was provided --->

<cfif NOT IsDefined("tasktype_id")>
	You did not specify a tasktype ID.
	<cfabort>
</cfif>

<!---delete tasktype --->

<cfinvoke component="tasktypes" method="delete" tasktype_id="#URL.tasktype_id#">
	
	
<cflocation url="tasktypes.cfm">	