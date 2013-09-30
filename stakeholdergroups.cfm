

<!---get all stakeholdergroups --->
<cfinvoke component="stakeholdergroups" method="list" returnvariable="stakeholdergroups">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "Stakeholder Groups">

<cfinclude template="header.cfm">



<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



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
