
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
	<cfset FormTitle="Update Stakeholder Group">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset stakeholdergroup_name="">
	<cfset stakeholdergroup_desc="">
	<cfset stakeholdergroup_size="">
	<cfset company_id="">
	
	<!---form text --->
	<cfset FormTitle="Add Stakeholder Group">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get companies --->
<cfinvoke component="stakeholdergroups" method="getCompanies" returnvariable="companies"> 

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

<!---add/update stakeholdergroup form --->
<cfform action="stakeholdergroup_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="stakeholdergroup_id" value="#stakeholdergroup.stakeholdergroup_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "300"><label> Stakeholder Group </label></td>
		<td><cfinput type="text" name="stakeholdergroup_name" value="#stakeholdergroup_name#" message="stakeholdergroup name is required" placeholder="Stakeholder Group Name" required="yes" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "200"><label> Stakeholder Group Description </label></td>
		<td><cfinput type="text" name="stakeholdergroup_desc" value="#stakeholdergroup_desc#" message="stakeholdergroup description is required" placeholder="Stakeholder Group Description" required="yes" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "200"><label> Stakeholder Group Size </label></td>
		<td><cfinput type="text" name="stakeholdergroup_size" value="#stakeholdergroup_size#" message="stakeholdergroup size is required" placeholder="Size" required="yes" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
	</tr>
	
	<tr>
		<td width = "200"><label> Company </label></td>
		<td><cfselect name="company_id" query="companies" value="company_id" display="company_name" selected="#VARIABLES.company_id#"></cfselect></td>
	</tr>
	
	
	

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


