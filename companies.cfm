<!---get all companies --->
<cfinvoke component="companies" method="list" returnvariable="companies">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="companies">
		<tr>
			<td>#company_name#</td>
			<td><a href="company_edit.cfm?company_id=#company_id#">Edit</a></td>
			<td><a href="company_delete.cfm?company_id=#company_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="company_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">