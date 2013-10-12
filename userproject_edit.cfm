
<!---check if userproject ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.userproject_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the userproject record --->
	<cfinvoke component="userproject" method="get" userproject_id="#URL.userproject_id#" returnvariable="userproject">
	
	<!---save to variables --->
	<cfset user_id=userproject.user_id>
	<cfset project_id=userproject.project_id>
	
	<!---form text --->
	<cfset FormTitle="Update User-Project">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_id="">
	<cfset project_id="">
	
	<!---form text --->
	<cfset FormTitle="Add User-Project">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get projects --->
<cfinvoke component="userproject" method="getProjects" returnvariable="projects"> 

<!---get users --->
<cfinvoke component="userproject" method="getUsers" returnvariable="users"> 

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
		<!--- <div class="widget-box">
			<div class="widget-header">
				<h4><cfoutput>#FormTitle#</cfoutput></h4>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding"> --->
<!--- closes beginning of form structure --->	

<!---add/update userproject form --->
<cfform action="userproject_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="userproject_id" value="#userproject.userproject_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>


	
	<tr>
		<td width = "150"><label> User </label></td>
		<td><cfselect name="user_id" query="users" value="user_id" display="user_lastname"  selected="#VARIABLES.user_id#"></cfselect></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Project </label></td>
		<td><cfselect name="project_id" query="projects" value="project_id" display="project_name"  selected="#VARIABLES.project_id#"></cfselect></td>
	</tr>
	
	
	


</table>
</fieldset>	

<br><br>
<!--- button part --->
	
	<!--- <div class="form-actions center"> --->
			<!--- <div class="col-md-offset-3 col-md-9">--->
				<cfoutput>
				<button class="btn btn-info" input type="submit" value="#ButtonText#">
					<i class="icon-ok bigger-110"></i>
					#ButtonText#
				</button>
				</cfoutput>
	<!--- </div> --->




</cfform>
<!---closes form structure --->
				<!--- 
				</div>
			</div>
		</div>--->	
</div>

<!---page footer --->
<cfinclude template="footer.cfm">



