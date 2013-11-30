<!---edit or update --->

<cfif IsDefined("FORM.feedtype_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="feedtypes" method="#method#" >

	<!---feedtype ID only if update method --->
	<cfif IsDefined("FORM.feedtype_id")>
		<cfinvokeargument name="feedtype_id" value="#FORM.feedtype_id#">
	</cfif>
	
	<cfinvokeargument name="feedtype_name" value="#Trim(FORM.feedtype_name)#">
	<cfinvokeargument name="feedtype_icon" value="#Trim(FORM.feedtype_icon)#">
	
</cfinvoke>

<cflocation url="feedtypes.cfm" >		 	