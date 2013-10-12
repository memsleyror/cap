

<!--- breadcrumb settings                                                               --->
<cfset session.menuTracker.menuTitle = "Global Settings">
<cfset session.menuTracker.subMenuTitle = "My Profile">


<!---check if user ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("session.auth.user_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the user record --->
	<cfinvoke component="users" method="get" user_id="#session.auth.user_id#" returnvariable="user">
	
	<!---save to variables --->
	<cfset user_login=Trim(user.user_login)>
	<cfset user_password=Trim(user.user_password)>
	<cfset user_firstname=Trim(user.user_firstname)>
	<cfset user_lastname=Trim(user.user_lastname)>
	<cfset user_email=Trim(user.user_email)>
	<cfset role_id=user.role_id>
	<cfset user_default_project_id=user.user_default_project_id>
	
	<!---form text --->
	<cfset FormTitle="Update My Profile">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_login="">
	<cfset user_password="">
	<cfset user_firstname="">
	<cfset user_lastname="">
	<cfset user_email="">
	<cfset role_id="">
	<cfset user_default_project_id="">
	
	
	<!---form text --->
	<cfset FormTitle="Add a User">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get roles --->
<cfinvoke component="users" method="getRoles" returnvariable="roles"> 

<!---get user projects 
<cfinvoke component="users" method="getUserProjects" returnvariable="userProjects"> 
--->

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
<cfform action="user_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="user_id" value="#user.user_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150"><label> Login </label></td>
		<td><cfinput type="text" name="user_login" value="#user_login#" message="user login is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Password </label></td>
		<td><cfinput type="text" name="user_password" value="#user_password#" message="user password is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> First Name </label></td>
		<td><cfinput type="text" name="user_firstname" value="#user_firstname#" message="user first name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Last Name </label></td>
		<td><cfinput type="text" name="user_lastname" value="#user_lastname#" message="user last name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Email </label></td>
		<td><cfinput type="text" name="user_email" value="#user_email#" message="user email is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Role </label></td>
		<td><cfselect name="role_id" query="roles" value="role_id" display="role_name" selected="#VARIABLES.role_id#"></cfselect></td>
	</tr>
	
	<!--- 
	<tr>
		<td>Default Project</td>
		<td><cfselect name="project_id" query="userProjects" value="project_id" display="project_name"   selected="#VARIABLES.project_id#" ></cfselect></td>
	</tr>
	--->
	
	
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




