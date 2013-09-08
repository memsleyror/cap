

<!---get all usercompanies --->
<cfinvoke component="usercompany" method="list" returnvariable="usercompanies">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="usercompanies">
		<tr>
			<td>#user_lastname#</td>
			<td>#company_name#</td>
			<td><a href="usercompany_edit.cfm?usercompany_id=#usercompany_id#">Edit</a></td>
			<td><a href="usercompany_delete.cfm?usercompany_id=#usercompany_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="usercompany_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
