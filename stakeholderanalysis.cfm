

<!---get all casesforchange --->
<cfinvoke component="stakeholderanalysis" method="list" returnvariable="stakeholderanalyses">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Prepare Phase">
<cfset session.menuTracker.subMenuTitle = "Stakeholder Analysis">

<cfinclude template="header.cfm">



<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



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

<!---page footer --->
<cfinclude template="footer.cfm">
