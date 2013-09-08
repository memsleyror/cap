<!---check to see if role ID was provided --->

<cfif NOT IsDefined("role_id")>
	You did not specify a role ID.
	<cfabort>
</cfif>

<!---delete role --->

<cfinvoke component="roles" method="delete" role_id="#URL.role_id#">
	
	
<cflocation url="roles.cfm">	