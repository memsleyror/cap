<!---edit or update --->

<cfif IsDefined("FORM.tasktype_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="tasktypes" method="#method#" >

	<!---tasktype ID only if update method --->
	<cfif IsDefined("FORM.tasktype_id")>
		<cfinvokeargument name="tasktype_id" value="#FORM.tasktype_id#">
	</cfif>
	
	<cfinvokeargument name="tasktype" value="#Trim(FORM.tasktype)#">
	
</cfinvoke>

<cflocation url="tasktypes.cfm" >		 	