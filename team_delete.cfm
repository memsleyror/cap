<!---check to see if team ID was provided --->

<cfif NOT IsDefined("team_id")>
	You did not specify a team ID.
	<cfabort>
</cfif>

<!---delete team --->

<cfinvoke component="teams" method="delete" team_id="#URL.team_id#">
	
	
<cflocation url="teams.cfm">	