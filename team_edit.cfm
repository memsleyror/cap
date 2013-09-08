
<!---check if team ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.team_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the team record --->
	<cfinvoke component="teams" method="get" team_id="#URL.team_id#" returnvariable="team">
	
	<!---save to variables --->
	<cfset team_name=Trim(team.team_name)>
	<cfset team_desc=Trim(team.team_desc)>
	<cfset team_size=Trim(team.team_size)>
	<cfset company_id=team.company_id>
	
	<!---form text --->
	<cfset FormTitle="Update a team">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset team_name="">
	<cfset team_desc="">
	<cfset team_size="">
	<cfset company_id="">
	
	<!---form text --->
	<cfset FormTitle="Add a team">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get companies --->
<cfinvoke component="teams" method="getCompanies" returnvariable="companies"> 

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update team form --->
<cfform action="team_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="team_id" value="#team.team_id#">
	</cfoutput>
</cfif>		

<table align="center">
	<tr>
		<th colspan="2">
			<cfoutput>
				#FormTitle#
			</cfoutput>	
		</th>
	</tr>
	
	<tr>
		<td>Team Name</td>
		<td><cfinput type="text" name="team_name" value="#team_name#" message="team name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Team Description</td>
		<td><cfinput type="text" name="team_desc" value="#team_desc#" message="team description is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Team Size</td>
		<td><cfinput type="text" name="team_size" value="#team_size#" message="team size is required" required="yes" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
	</tr>
	
	<tr>
		<td>Company</td>
		<td><cfselect name="company_id" query="companies" value="company_id" display="company_name" selected="#VARIABLES.company_id#"></cfselect></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<cfoutput>
				<input type="submit" value="#ButtonText#">
			</cfoutput>	
		</td>
	</tr>
	
</table>

</cfform>

<!---page footer --->
<cfinclude template="footer.cfm">














	