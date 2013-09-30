<!---get all versions --->
<cfinvoke component="versions" method="list" returnvariable="versions">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Global Settings">
<cfset session.menuTracker.subMenuTitle = "Versions">

<cfinclude template="header.cfm">


<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">

<table align="center">
	<cfoutput query="versions">
		<tr>
			<td>#version_name#</td>
			<td><a href="version_edit.cfm?version_id=#version_id#">Edit</a></td>
			<td><a href="version_delete.cfm?version_id=#version_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="version_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">