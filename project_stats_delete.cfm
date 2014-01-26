<!---check to see if project_stat ID was provided --->

<cfif NOT IsDefined("project_stat_id")>
	You did not specify a project_stat ID.
	<cfabort>
</cfif>

<!---delete project_stat --->

<cfinvoke component="project_stats" method="delete" project_stat_id="#URL.project_stat_id#">
	
	
<cflocation url="project_stats.cfm">	