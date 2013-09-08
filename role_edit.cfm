
<!---check if role ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.role_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the role record --->
	<cfinvoke component="roles" method="get" role_id="#URL.role_id#" returnvariable="role">
	
	<!---save to variables --->
	<cfset role_name=Trim(role.role_name)>
	<cfset role_desc=Trim(role.role_desc)>
	
	
	<!---form text --->
	<cfset FormTitle="Update a Role">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset role_name="">
	<cfset role_desc="">
	
	
	<!---form text --->
	<cfset FormTitle="Add a Role">
	<cfset ButtonText="Insert">
	
</cfif>

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update role form --->
<cfform action="role_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="role_id" value="#role.role_id#">
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
		<td>Role Name</td>
		<td><cfinput type="text" name="role_name" value="#role_name#" message="role name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Role Description</td>
		<td><cfinput type="text" name="role_desc" value="#role_desc#" message="role description is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
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



