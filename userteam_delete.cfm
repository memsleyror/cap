<!---check to see if userteam_id ID was provided --->

<cfif NOT IsDefined("userteam_id")>
	You did not specify a userteam ID.
	<cfabort>
</cfif>

<!---delete userteam --->

<cfinvoke component="userteam" method="delete" userteam_id="#URL.userteam_id#">
	
	
<cflocation url="userteam.cfm">	