

<!---get all projects --->
<cfinvoke component="projects" method="list" returnvariable="projects">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "Projects">

<cfinclude template="header.cfm">



<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">


<table align="center">
	<cfoutput query="projects">
		<tr>
			<td>#project_name#</td>
			<td><a href="project_edit.cfm?project_id=#project_id#">Edit</a></td>
			<td><a href="project_delete.cfm?project_id=#project_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="project_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">
