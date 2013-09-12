
<!---check if userteam ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.userteam_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the userteam record --->
	<cfinvoke component="userteam" method="get" userteam_id="#URL.userteam_id#" returnvariable="userteam">
	
	<!---save to variables --->
	<cfset user_id=userteam.user_id>
	<cfset team_id=userteam.team_id>
	
	<!---form text --->
	<cfset FormTitle="Update a Userteam">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_id="">
	<cfset team_id="">
	
	<!---form text --->
	<cfset FormTitle="Add a Userteam">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get teams --->
<cfinvoke component="userteam" method="getTeams" returnvariable="teams"> 

<!---get users --->
<cfinvoke component="userteam" method="getUsers" returnvariable="users"> 

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update userteam form --->
<cfform action="userteam_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="userteam_id" value="#userteam.userteam_id#">
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
		<td>Team</td>
		<td><cfselect name="team_id" query="teams" value="team_id" display="team_name" selected="#VARIABLES.team_id#"></cfselect></td>
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



