

<!---get all casesforchange --->
<cfinvoke component="stakeholderanalysis" method="list" returnvariable="stakeholderanalyses">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="stakeholderanalyses">
		<tr>
			<td>#stakeholderanalysis_id#</td>
			<td>#stakeholdergroup_name#</td>
			<td>#DateFormat(stakeholderanalysis_date, "MM/DD/YYYY")#</td>
			<td><a href="stakeholderanalysis_edit.cfm?stakeholderanalysis_id=#stakeholderanalysis_id#">Edit</a></td>
			<td><a href="stakeholderanalysis_delete.cfm?stakeholderanalysis_id=#stakeholderanalysis_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="stakeholderanalysis_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
