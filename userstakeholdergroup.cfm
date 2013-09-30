

<!---get all userstakeholdergroups --->
<cfinvoke component="userstakeholdergroup" method="list" returnvariable="userstakeholdergroups">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "User-Stakeholder Group">

<cfinclude template="header.cfm">



<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">


<table align="center">
	<cfoutput query="userstakeholdergroups">
		<tr>
			<td>#user_lastname#</td>
			<td>#stakeholdergroup_name#</td>
			<td><a href="userstakeholdergroup_edit.cfm?userstakeholdergroup_id=#userstakeholdergroup_id#">Edit</a></td>
			<td><a href="userstakeholdergroup_delete.cfm?userstakeholdergroup_id=#userstakeholdergroup_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="userstakeholdergroup_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
