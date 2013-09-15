
<!---check if userstakeholdergroup ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.userstakeholdergroup_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the userstakeholdergroup record --->
	<cfinvoke component="userstakeholdergroup" method="get" userstakeholdergroup_id="#URL.userstakeholdergroup_id#" returnvariable="userstakeholdergroup">
	
	<!---save to variables --->
	<cfset user_id=userstakeholdergroup.user_id>
	<cfset stakeholdergroup_id=userstakeholdergroup.stakeholdergroup_id>
	
	<!---form text --->
	<cfset FormTitle="Update a Userstakeholdergroup">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_id="">
	<cfset stakeholdergroup_id="">
	
	<!---form text --->
	<cfset FormTitle="Add a Userstakeholdergroup">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get stakeholdergroups --->
<cfinvoke component="userstakeholdergroup" method="getstakeholdergroups" returnvariable="stakeholdergroups"> 

<!---get users --->
<cfinvoke component="userstakeholdergroup" method="getUsers" returnvariable="users"> 

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update userstakeholdergroup form --->
<cfform action="userstakeholdergroup_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="userstakeholdergroup_id" value="#userstakeholdergroup.userstakeholdergroup_id#">
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
		<td>Stakeholder Group</td>
		<td><cfselect name="stakeholdergroup_id" query="stakeholdergroups" value="stakeholdergroup_id" display="stakeholdergroup_name" selected="#VARIABLES.stakeholdergroup_id#"></cfselect></td>
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



