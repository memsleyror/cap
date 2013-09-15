

<!---get all stakeholdergroups --->
<cfinvoke component="stakeholdergroups" method="list" returnvariable="stakeholdergroups">

<!---page header --->
<cfinclude template="header.cfm">


<table align="center">
	<cfoutput query="stakeholdergroups">
		<tr>
			<td>#stakeholdergroup_name#</td>
			<td><a href="stakeholdergroup_edit.cfm?stakeholdergroup_id=#stakeholdergroup_id#">Edit</a></td>
			<td><a href="stakeholdergroup_delete.cfm?stakeholdergroup_id=#stakeholdergroup_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="stakeholdergroup_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">
