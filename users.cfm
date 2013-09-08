<!---get all users --->
<cfinvoke component="users" method="list" returnvariable="users">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="users">
		<tr>
			<td>#user_lastname#</td>
			<td><a href="user_edit.cfm?user_id=#user_id#">Edit</a></td>
			<td><a href="user_delete.cfm?user_id=#user_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="user_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">