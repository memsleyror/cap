
<!---check if milestone ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.milestone_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the user record --->
	<cfinvoke component="milestones" method="get" milestone_id="#URL.milestone_id#" returnvariable="milestone">
	
	<!---save to variables --->
	<cfset milestone_name=Trim(milestone.milestone_name)>
	<cfset milestone_desc=Trim(milestone.milestone_desc)>
	<cfset milestone_date=DateFormat(milestone.milestone_date,"MM/DD/YYYY")>
	<cfset project_id=milestone.project_id>
	
	<!---form text --->
	<cfset FormTitle="Update a Milestone">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset milestone_name="">
	<cfset milestone_desc="">
	<cfset milestone_date="">
	<cfset project_id="">
	
	
	<!---form text --->
	<cfset FormTitle="Add a Milestone">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get projects --->
<cfinvoke component="milestones" method="getProjects" returnvariable="projects"> 


<!---page header --->
<cfinclude template="header.cfm">

<!---add/update user form --->
<cfform action="milestone_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="milestone_id" value="#milestone.milestone_id#">
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
		<td>Milestone Name</td>
		<td><cfinput type="text" name="milestone_name" value="#milestone_name#" message="milestone name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Milestone Description</td>
		<td><cfinput type="text" name="milestone_desc" value="#milestone_desc#" message="milestone description is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Milestone Date</td>
		<td><cfinput type="text" name="milestone_date" value="#milestone_date#" message="must be a valid date" required="yes" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
	</tr>
	
	<tr>
		<td>Project</td>
		<td><cfselect name="project_id" query="projects" value="project_id" display="project_name" selected="#VARIABLES.project_id#"></cfselect></td>
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



