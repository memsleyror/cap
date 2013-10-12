
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
	<cfset FormTitle="Update Team">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset team_name="">
	<cfset team_desc="">
	<cfset team_size="">
	<cfset company_id="">
	
	<!---form text --->
	<cfset FormTitle="Add Team">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get companies --->
<cfinvoke component="teams" method="getCompanies" returnvariable="companies"> 

<!---page header --->
<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
		<small>
			<i class="icon-double-angle-right"></i>
			<cfoutput>#FormTitle#</cfoutput>
		</small>
	</h1>
</div><!-- /.page-header -->

<!--- sets up beginning of form structure --->
<div class="col-sm-6">
		
<!--- closes beginning of form structure --->	

<!---add/update team form --->
<cfform action="team_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="team_id" value="#team.team_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150"><label> Team Name </label></td>
		<td><cfinput type="text" name="team_name" value="#team_name#" message="team name is required" required="yes" placeholder="Team Name" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Team Description </label></td>
		<td><cfinput type="text" name="team_desc" value="#team_desc#" message="team description is required" required="yes" placeholder="Team Description" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Team Size </label></td>
		<td><cfinput type="text" name="team_size" value="#team_size#" message="team size is required" required="yes" placeholder="Team Size" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Company </label></td>
		<td><cfselect name="company_id" query="companies" value="company_id" display="company_name" selected="#VARIABLES.company_id#"></cfselect></td>
	</tr>
	
	
	

</table>
</fieldset>	

<br><br>
<!--- button part --->
	
	
				<cfoutput>
				<button class="btn btn-info" input type="submit" value="#ButtonText#">
					<i class="icon-ok bigger-110"></i>
					#ButtonText#
				</button>
				</cfoutput>

<!--- close form --->	

</cfform>

</div>

<!---page footer --->
<cfinclude template="footer.cfm">













	