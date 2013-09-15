
<!---check if stakeholdergroup ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.stakeholdergroup_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the stakeholdergroup record --->
	<cfinvoke component="stakeholdergroups" method="get" stakeholdergroup_id="#URL.stakeholdergroup_id#" returnvariable="stakeholdergroup">
	
	<!---save to variables --->
	<cfset stakeholdergroup_name=Trim(stakeholdergroup.stakeholdergroup_name)>
	<cfset stakeholdergroup_desc=Trim(stakeholdergroup.stakeholdergroup_desc)>
	<cfset stakeholdergroup_size=Trim(stakeholdergroup.stakeholdergroup_size)>
	<cfset company_id=stakeholdergroup.company_id>
	
	<!---form text --->
	<cfset FormTitle="Update a stakeholdergroup">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset stakeholdergroup_name="">
	<cfset stakeholdergroup_desc="">
	<cfset stakeholdergroup_size="">
	<cfset company_id="">
	
	<!---form text --->
	<cfset FormTitle="Add a stakeholdergroup">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get companies --->
<cfinvoke component="stakeholdergroups" method="getCompanies" returnvariable="companies"> 

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update stakeholdergroup form --->
<cfform action="stakeholdergroup_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="stakeholdergroup_id" value="#stakeholdergroup.stakeholdergroup_id#">
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
		<td>Stakeholder Group Name</td>
		<td><cfinput type="text" name="stakeholdergroup_name" value="#stakeholdergroup_name#" message="stakeholdergroup name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Stakeholder Group Description</td>
		<td><cfinput type="text" name="stakeholdergroup_desc" value="#stakeholdergroup_desc#" message="stakeholdergroup description is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>Stakeholder Group Size</td>
		<td><cfinput type="text" name="stakeholdergroup_size" value="#stakeholdergroup_size#" message="stakeholdergroup size is required" required="yes" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
	</tr>
	
	<tr>
		<td>Company</td>
		<td><cfselect name="company_id" query="companies" value="company_id" display="company_name" selected="#VARIABLES.company_id#"></cfselect></td>
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

