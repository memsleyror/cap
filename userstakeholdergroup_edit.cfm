
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
	<cfset FormTitle="Update User-Stakeholder Group">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_id="">
	<cfset stakeholdergroup_id="">
	
	<!---form text --->
	<cfset FormTitle="Add User-Stakeholder Group">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get stakeholdergroups --->
<cfinvoke component="userstakeholdergroup" method="getstakeholdergroups" returnvariable="stakeholdergroups"> 

<!---get users --->
<cfinvoke component="userstakeholdergroup" method="getUsers" returnvariable="users"> 

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

<!---add/update userstakeholdergroup form --->
<cfform action="userstakeholdergroup_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="userstakeholdergroup_id" value="#userstakeholdergroup.userstakeholdergroup_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150"><label> User </label></td>
		<td><cfselect name="user_id" query="users" value="user_id" display="user_lastname" selected="#VARIABLES.user_id#"></cfselect></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Stakeholder Group </label></td>
		<td><cfselect name="stakeholdergroup_id" query="stakeholdergroups" value="stakeholdergroup_id" display="stakeholdergroup_name" selected="#VARIABLES.stakeholdergroup_id#"></cfselect></td>
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



