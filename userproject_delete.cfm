<!---check to see if userproject_id ID was provided --->

<cfif NOT IsDefined("userproject_id")>
	You did not specify a userproject ID.
	<cfabort>
</cfif>

<!---delete userproject --->

<cfinvoke component="userproject" method="delete" userproject_id="#URL.userproject_id#">
	
	
<cflocation url="userproject.cfm">	