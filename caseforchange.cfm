

<!---get all casesforchange --->
<cfinvoke component="caseforchange" method="list" returnvariable="casesforchange">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="casesforchange">
		<tr>
			<td>#caseforchange_id#</td>
			<td>#project_name#</td>
			<td><a href="caseforchange_edit.cfm?caseforchange_id=#caseforchange_id#">Edit</a></td>
			<td><a href="caseforchange_delete.cfm?caseforchange_id=#caseforchange_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="caseforchange_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
