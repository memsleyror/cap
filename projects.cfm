

<!---get all projects --->
<cfinvoke component="projects" method="list" returnvariable="projects">

<!---page header --->
<cfinclude template="header.cfm">


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

<!---page header --->
<cfinclude template="footer.cfm">
