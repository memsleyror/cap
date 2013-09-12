

<!---get all userteams --->
<cfinvoke component="userteam" method="list" returnvariable="userteams">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="userteams">
		<tr>
			<td>#user_lastname#</td>
			<td>#team_name#</td>
			<td><a href="userteam_edit.cfm?userteam_id=#userteam_id#">Edit</a></td>
			<td><a href="userteam_delete.cfm?userteam_id=#userteam_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="userteam_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
