
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
	<cfset FormTitle="Update User-Team">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_id="">
	<cfset team_id="">
	
	<!---form text --->
	<cfset FormTitle="Add User-Team">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get teams --->
<cfinvoke component="userteam" method="getTeams" returnvariable="teams"> 

<!---get users --->
<cfinvoke component="userteam" method="getUsers" returnvariable="users"> 

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

<!---add/update userteam form --->
<cfform action="userteam_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="userteam_id" value="#userteam.userteam_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "100"><label> User </label></td>
		<td><cfselect name="user_id" query="users" value="user_id" display="user_lastname" selected="#VARIABLES.user_id#"></cfselect></td>
	</tr>
	
	<tr>
		<td width = "100"><label> Team </label></td>
		<td><cfselect name="team_id" query="teams" value="team_id" display="team_name" selected="#VARIABLES.team_id#"></cfselect></td>
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



