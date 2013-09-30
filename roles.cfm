<!---get all roles --->
<cfinvoke component="roles" method="list" returnvariable="roles">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "Roles">

<cfinclude template="header.cfm">



<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



<table align="center">
	<cfoutput query="roles">
		<tr>
			<td>#role_name#</td>
			<td><a href="role_edit.cfm?role_id=#role_id#">Edit</a></td>
			<td><a href="role_delete.cfm?role_id=#role_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="role_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">