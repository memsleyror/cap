<!---get all roles --->
<cfinvoke component="roles" method="list" returnvariable="roles">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="roles">
		<tr>
			<td>#role_name#</td>
			<td><a href="role_edit.cfm?role_id=#role_id#">Edit</a></td>
			<td><a href="role_delete.cfm?role_id=#role_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="role_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">