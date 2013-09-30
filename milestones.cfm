

<!---get all milestones --->
<cfinvoke component="milestones" method="list" returnvariable="milestones">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "Milestones">

<cfinclude template="header.cfm">




<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">


<table align="center">
	<cfoutput query="milestones">
		<tr>
			<td>#milestone_name#</td>
			<td><a href="milestone_edit.cfm?milestone_id=#milestone_id#">Edit</a></td>
			<td><a href="milestone_delete.cfm?milestone_id=#milestone_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="milestone_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">
