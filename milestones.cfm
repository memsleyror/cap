

<!---get all milestones --->
<cfinvoke component="milestones" method="list" returnvariable="milestones">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="milestones">
		<tr>
			<td>#milestone_name#</td>
			<td><a href="milestone_edit.cfm?milestone_id=#milestone_id#">Edit</a></td>
			<td><a href="milestone_delete.cfm?milestone_id=#milestone_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="milestone_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
