

<!---get all userprojects --->
<cfinvoke component="userproject" method="list" returnvariable="userprojects">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "User-Project">

<cfinclude template="header.cfm">





<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



<table align="center">
	<cfoutput query="userprojects">
		<tr>
			<td>#user_lastname#</td>
			<td>#project_name#</td>
			<td><a href="userproject_edit.cfm?userproject_id=#userproject_id#">Edit</a></td>
			<td><a href="userproject_delete.cfm?userproject_id=#userproject_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="userproject_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
