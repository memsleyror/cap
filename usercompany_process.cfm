<!---edit or update --->

<cfif IsDefined("FORM.usercompany_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="usercompany" method="#method#" >

	<!---project ID only if update method --->
	<cfif IsDefined("FORM.usercompany_id")>
		<cfinvokeargument name="usercompany_id" value="#FORM.usercompany_id#">
	</cfif>
	
	<cfinvokeargument name="user_id" value="#Int(FORM.user_id)#">
	<cfinvokeargument name="company_id" value="#Int(FORM.company_id)#">

</cfinvoke>

<cflocation url="usercompany.cfm" >		 		