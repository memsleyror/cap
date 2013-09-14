<!---edit or update --->

<cfif IsDefined("FORM.version_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="versions" method="#method#" >

	<!---version ID only if update method --->
	<cfif IsDefined("FORM.version_id")>
		<cfinvokeargument name="version_id" value="#FORM.version_id#">
	</cfif>
	
	<cfinvokeargument name="version_name" value="#Trim(FORM.version_name)#">
	
</cfinvoke>

<cflocation url="versions.cfm" >		 	