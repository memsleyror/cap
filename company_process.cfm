<!---edit or update --->

<cfif IsDefined("FORM.company_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="companies" method="#method#" >

	<!---company ID only if update method --->
	<cfif IsDefined("FORM.company_id")>
		<cfinvokeargument name="company_id" value="#FORM.company_id#">
	</cfif>
	
	<cfinvokeargument name="company_name" value="#Trim(FORM.company_name)#">
	<cfinvokeargument name="company_desc" value="#Trim(FORM.company_desc)#">
	
</cfinvoke>

<cflocation url="companies.cfm" >		 	