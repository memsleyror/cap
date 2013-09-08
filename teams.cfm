

<!---get all teams --->
<cfinvoke component="teams" method="list" returnvariable="teams">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="teams">
		<tr>
			<td>#team_name#</td>
			<td><a href="team_edit.cfm?team_id=#team_id#">Edit</a></td>
			<td><a href="team_delete.cfm?team_id=#team_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="team_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">
