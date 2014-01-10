
<!---check if task ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.task_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the task record --->
	<cfinvoke component="#application.taskService#" method="get" task_id="#URL.task_id#" returnvariable="task">

	<!---save to variables --->
	<cfset task_desc=Trim(task.task_desc)>
	<cfset task_start_date=DateFormat(task.task_start_date,"MM/DD/YYYY")>
	<cfset task_end_date=DateFormat(task.task_end_date,"MM/DD/YYYY")>
	<cfset tasktype_id=task.tasktype_id>
	<cfset project_id=task.project_id>
	<cfset selectedRoles = task.roles>
	
	<!---form text --->
	<cfset FormTitle="Update task">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset task_desc="">
	<cfset project_id="">
	<cfset task_start_date="">
	<cfset task_end_date="">
	<cfset tasktype_id="">
	<cfset selectedRoles = "">
	
	<!---form text --->
	<cfset FormTitle="Add task">
	<cfset ButtonText="Insert">
	
</cfif>


<!---get tasktypes --->
<cfinvoke component="#application.taskService#" method="getTasktypes" returnvariable="tasktypes"> 

<!---get projects --->
<cfinvoke component="#application.taskService#" method="getProjects" returnvariable="projects"> 

<!--- get roles --->
<cfinvoke component="roles" method="list" returnVariable="roles">

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

<!---add/update task form --->
<cfform action="task_process.cfm" class="form-horizontal" role="form">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="task_id" value="#task.task_id#">
	</cfoutput>
</cfif>		

<fieldset>

<table>

<tr>
	<td width = "150"><label> Task </label></td>
	<td><cfinput type="text" name="task_desc" value="#task_desc#" id="form-field-1" message="task name is required" required="yes" validateAt="onSubmit,onServer" placeholder="task Name" size="30" /></td>
</tr>	

<tr>
	<td><label> Project </label>
	<td><cfselect name="project_id" class="form-control" query="projects" value="project_id" display="project_name" selected="#VARIABLES.project_id#"></cfselect></td>
</tr>

<tr>
	<td><label> Task Start Date </label>
	<td><cfinput type="text" name="task_start_date" value="#task_start_date#" id="form-field-3" message="start date is required" required="yes" validate="date" validateAt="onSubmit,onServer" placeholder="mm/dd/yyyy"  /></td>
</tr>
<tr>
	<td><label> Task End Date </label>
	<td><cfinput type="text" name="task_end_date" value="#task_end_date#" id="form-field-4" message="end date is required" required="yes" validate="date" validateAt="onSubmit,onServer" placeholder="mm/dd/yyyy"  /></td>
</tr>
<tr>
	<td><label> Task Type </label>
	<td><cfselect name="tasktype_id" class="form-control" query="tasktypes" value="tasktype_id" display="tasktype" selected="#VARIABLES.tasktype_id#"></cfselect></td>
</tr>	
<tr>
	<td><label>Roles</label></td>
	<td>
		<cfloop query="roles">
			<cfoutput>
			<input type="checkbox" name="roles" value="#role_id#" <cfif listFind(selectedRoles, role_id)>checked</cfif> id="role_#role_id#"> 
			<label for="role_#role_id#">#role_name#</label><br/>
			</cfoutput>
		</cfloop>
	</td>
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

