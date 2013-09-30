

<!---get all teams --->
<cfinvoke component="teams" method="list" returnvariable="teams">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "Teams">

<cfinclude template="header.cfm">




<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



<table align="center">
	<cfoutput query="teams">
		<tr>
			<td>#team_name#</td>
			<td><a href="team_edit.cfm?team_id=#team_id#">Edit</a></td>
			<td><a href="team_delete.cfm?team_id=#team_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="team_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">
