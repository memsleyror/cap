<!---check to see if project ID was provided --->

<cfif NOT IsDefined("project_id")>
	You did not specify a project ID.
	<cfabort>
</cfif>

<!---delete project --->

<cfinvoke component="projects" method="delete" project_id="#URL.project_id#">
	
	
<cflocation url="projects.cfm">	