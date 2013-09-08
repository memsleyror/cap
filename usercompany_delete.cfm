<!---check to see if usercompany_id ID was provided --->

<cfif NOT IsDefined("usercompany_id")>
	You did not specify a usercompany ID.
	<cfabort>
</cfif>

<!---delete usercompany --->

<cfinvoke component="usercompany" method="delete" usercompany_id="#URL.usercompany_id#">
	
	
<cflocation url="usercompany.cfm">	