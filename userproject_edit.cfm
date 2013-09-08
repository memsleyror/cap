
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
	<cfset FormTitle="Update a Userproject">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_id="">
	<cfset project_id="">
	
	<!---form text --->
	<cfset FormTitle="Add a Userproject">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get projects --->
<cfinvoke component="userproject" method="getProjects" returnvariable="projects"> 

<!---get users --->
<cfinvoke component="userproject" method="getUsers" returnvariable="users"> 

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update userproject form --->
<cfform action="userproject_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="userproject_id" value="#userproject.userproject_id#">
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
		<td>User</td>
		<td><cfselect name="user_id" query="users" value="user_id" display="user_lastname" selected="#VARIABLES.user_id#"></cfselect></td>
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



