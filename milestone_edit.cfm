
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

<!---add/update user form --->
<cfform action="milestone_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="milestone_id" value="#milestone.milestone_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150"><label> Milestone Name </label></td>
		<td><cfinput type="text" name="milestone_name" value="#milestone_name#" id="form-field-1" message="milestone name is required" required="yes" validateAt="onSubmit,onServer" placeholder="Milestone Name"  size="30" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Milestone Description </label></td>
		<td><cfinput type="text" name="milestone_desc" value="#milestone_desc#" id="form-field-2" message="milestone description is required" required="yes" validateAt="onSubmit,onServer" placeholder="Milestone Description" size="30" ></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Milestone Date </label></td>
		<td><cfinput type="text" name="milestone_date" value="#milestone_date#" id="form-field-3" message="must be a valid date" required="yes" validateAt="onSubmit,onServer" placeholder="mm/dd/yyyy" ></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Project </label></td>
		<td><cfselect name="project_id" class="form-control" query="projects" value="project_id" display="project_name" selected="#VARIABLES.project_id#"></cfselect></td>
	</tr>
	
</table>
</fieldset>	
<br><br>
<!--- button part --->
	
	
			<!--- <div class="col-md-offset-3 col-md-9">--->
				<cfoutput>
				<button class="btn btn-info" input type="submit" value="#ButtonText#">
					<i class="icon-ok bigger-110"></i>
					#ButtonText#
				</button>
				</cfoutput>
	




</cfform>
<!---closes form structure --->
			
</div>

<!---page footer --->
<cfinclude template="footer.cfm">




