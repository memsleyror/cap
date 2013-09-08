<!---check to see if user ID was provided --->

<cfif NOT IsDefined("user_id")>
	You did not specify a user ID.
	<cfabort>
</cfif>

<!---delete user --->

<cfinvoke component="users" method="delete" user_id="#URL.user_id#">
	
	
<cflocation url="users.cfm">	