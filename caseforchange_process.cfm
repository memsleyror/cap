<!---edit or update --->

<cfif IsDefined("FORM.caseforchange_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="caseforchange" method="#method#" >

	<!---user ID only if update method --->
	<cfif IsDefined("FORM.caseforchange_id")>
		<cfinvokeargument name="caseforchange_id" value="#FORM.caseforchange_id#">
	</cfif>
	
	<cfinvokeargument name="caseforchange_text" value="#Trim(FORM.caseforchange_text)#">
	<cfinvokeargument name="caseforchange_date" value="#DateFormat(FORM.caseforchange_date)#">
	<cfinvokeargument name="project_id" value="#Int(FORM.project_id)#">
	<cfinvokeargument name="user_id" value="#Int(FORM.user_id)#">
	<cfinvokeargument name="version_id" value="#Int(FORM.version_id)#">
	
	
</cfinvoke>

<cflocation url="caseforchange.cfm" >		 	