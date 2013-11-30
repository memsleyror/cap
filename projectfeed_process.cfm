<!---edit or update --->

<cfif IsDefined("FORM.projectfeed_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="projectfeed" method="#method#" >

	<!---user ID only if update method --->
	<cfif IsDefined("FORM.projectfeed_id")>
		<cfinvokeargument name="projectfeed_id" value="#FORM.projectfeed_id#">
	</cfif>
	
	<cfinvokeargument name="projectfeed_title" value="#Trim(FORM.projectfeed_title)#">
	<cfinvokeargument name="projectfeed_text" value="#Trim(FORM.projectfeed_text)#">
	<cfinvokeargument name="projectfeed_date" value="#DateFormat(FORM.projectfeed_date)#">
	<cfinvokeargument name="project_id" value="#Int(FORM.project_id)#">
	<cfinvokeargument name="user_id" value="#Int(FORM.user_id)#">
	<cfinvokeargument name="feedtype_id" value="#Int(FORM.feedtype_id)#">
	
	
</cfinvoke>

<cflocation url="projectfeed.cfm" >		 	