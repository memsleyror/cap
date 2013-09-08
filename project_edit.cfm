
<!---check if project ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.project_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the project record --->
	<cfinvoke component="projects" method="get" project_id="#URL.project_id#" returnvariable="project">
	
	<!---save to variables --->
	<cfset project_name=Trim(project.project_name)>
	<cfset project_desc=Trim(project.project_desc)>
	<cfset project_start_date=DateFormat(project.project_start_date,"MM/DD/YYYY")>
	<cfset project_end_date=DateFormat(project.project_end_date,"MM/DD/YYYY")>
	<cfset company_id=project.company_id>
	
	<!---form text --->
	<cfset FormTitle="Update a Project">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset project_name="">
	<cfset project_desc="">
	<cfset project_start_date="">
	<cfset project_end_date="">
	<cfset company_id="">
	
	<!---form text --->
	<cfset FormTitle="Add a Project">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get companies --->
<cfinvoke component="projects" method="getCompanies" returnvariable="companies"> 

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update project form --->
<cfform action="project_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="project_id" value="#project.project_id#">
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
		<td>Project Name</td>
		<td><cfinput type="text" name="project_name" value="#project_name#" message="project name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Project Description</td>
		<td><cfinput type="text" name="project_desc" value="#project_desc#" message="project description is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Project Start Date</td>
		<td><cfinput type="text" name="project_start_date" value="#project_start_date#" message="must be a valid date" required="yes" validate="date" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
	</tr>
	
	<tr>
		<td>Project End Date</td>
		<td><cfinput type="text" name="project_end_date" value="#project_end_date#" message="must be a valid date" required="yes" validate="date" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
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














	