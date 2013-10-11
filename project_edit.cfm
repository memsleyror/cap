
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
	<cfset FormTitle="Update Project">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset project_name="">
	<cfset project_desc="">
	<cfset project_start_date="">
	<cfset project_end_date="">
	<cfset company_id="">
	
	<!---form text --->
	<cfset FormTitle="Add Project">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get companies --->
<cfinvoke component="projects" method="getCompanies" returnvariable="companies"> 

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
		<div class="widget-box">
			<div class="widget-header">
				<h4><cfoutput>#FormTitle#</cfoutput></h4>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
<!--- closes beginning of form structure --->	

<!---add/update project form --->
<cfform action="project_process.cfm" class="form-horizontal" role="form">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="project_id" value="#project.project_id#">
	</cfoutput>
</cfif>		

<fieldset>

<table>

<tr>
	<td width = "150"><label> Project Name </label></td>
	<td><cfinput type="text" name="project_name" value="#project_name#" id="form-field-1" message="project name is required" required="yes" validateAt="onSubmit,onServer" placeholder="Project Name" size="30" /></td>
</tr>	

<tr>
	<td><label> Project Description </label>
	<td><cfinput type="text" name="project_desc" value="#project_desc#" id="form-field-2" message="project desc is required" required="yes" validateAt="onSubmit,onServer" placeholder="Project Description" size="30" /></td>
</tr>

<tr>
	<td><label> Project Start Date </label>
	<td><cfinput type="text" name="project_start_date" value="#project_start_date#" id="form-field-3" message="start date is required" required="yes" validate="date" validateAt="onSubmit,onServer" placeholder="mm/dd/yyyy"  /></td>
</tr>
<tr>
	<td><label> Project End Date </label>
	<td><cfinput type="text" name="project_end_date" value="#project_end_date#" id="form-field-4" message="end date is required" required="yes" validate="date" validateAt="onSubmit,onServer" placeholder="mm/dd/yyyy"  /></td>
</tr>
<tr>
	<td><label> Company </label>
	<td><cfselect name="company_id" class="form-control" query="companies" value="company_id" display="company_name" selected="#VARIABLES.company_id#"></cfselect></td>
</tr>	
</table>
</fieldset>

<!--- button part --->
	
	<div class="form-actions center">
			<!--- <div class="col-md-offset-3 col-md-9">--->
				<cfoutput>
				<button class="btn btn-info" input type="submit" value="#ButtonText#">
					<i class="icon-ok bigger-110"></i>
					#ButtonText#
				</button>
				</cfoutput>
	</div>




</cfform>
<!---closes form structure --->
					
				</div>
			</div>
		</div>
</div>

<!--- page footer --->
<cfinclude template="footer.cfm">














	