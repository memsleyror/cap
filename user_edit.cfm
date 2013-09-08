
<!---check if user ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.user_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the user record --->
	<cfinvoke component="users" method="get" user_id="#URL.user_id#" returnvariable="user">
	
	<!---save to variables --->
	<cfset user_login=Trim(user.user_login)>
	<cfset user_password=Trim(user.user_password)>
	<cfset user_firstname=Trim(user.user_firstname)>
	<cfset user_lastname=Trim(user.user_lastname)>
	<cfset user_email=Trim(user.user_email)>	
	<cfset role_id=user.role_id>
	
	<!---form text --->
	<cfset FormTitle="Update a User">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_login="">
	<cfset user_password="">
	<cfset user_firstname="">
	<cfset user_lastname="">
	<cfset user_email="">
	<cfset role_id="">
	
	
	<!---form text --->
	<cfset FormTitle="Add a User">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get roles --->
<cfinvoke component="users" method="getRoles" returnvariable="roles"> 


<!---page header --->
<cfinclude template="header.cfm">

<!---add/update user form --->
<cfform action="user_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="user_id" value="#user.user_id#">
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
		<td>Login</td>
		<td><cfinput type="text" name="user_login" value="#user_login#" message="user login is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Password</td>
		<td><cfinput type="text" name="user_password" value="#user_password#" message="user password is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>First Name</td>
		<td><cfinput type="text" name="user_firstname" value="#user_firstname#" message="user first name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Last Name</td>
		<td><cfinput type="text" name="user_lastname" value="#user_lastname#" message="user last name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Email</td>
		<td><cfinput type="text" name="user_email" value="#user_email#" message="user email is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Role</td>
		<td><cfselect name="role_id" query="roles" value="role_id" display="role_name" selected="#VARIABLES.role_id#"></cfselect></td>
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



