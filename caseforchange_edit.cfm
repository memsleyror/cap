
<!---check if caseforchange ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.caseforchange_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the caseforchange record --->
	<cfinvoke component="caseforchange" method="get" caseforchange_id="#URL.caseforchange_id#" returnvariable="caseforchange">
	
	<!---save to variables --->
	<cfset caseforchange_text=Trim(caseforchange.caseforchange_text)>
	<cfset caseforchange_date=DateFormat(caseforchange.caseforchange_date,"MM/DD/YYYY")>
	<cfset user_id=caseforchange.user_id>
	<cfset project_id=caseforchange.project_id>
	<cfset version_id=caseforchange.version_id>
	
	<!---form text --->
	<cfset FormTitle="Update Case for Change">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset caseforchange_text="">
	<cfset caseforchange_date="">
	<cfset user_id="">
	<cfset project_id="">
	<cfset version_id="">
	
	<!---form text --->
	<cfset FormTitle="Add Case for Change">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get projects --->
<cfinvoke component="caseforchange" method="getProjects" returnvariable="projects"> 

<!---get users --->
<cfinvoke component="caseforchange" method="getUsers" returnvariable="users"> 

<!---get versions --->
<cfinvoke component="caseforchange" method="getVersions" returnvariable="versions"> 

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
<div class="col-sm-7">
		
<!--- closes beginning of form structure --->	

<!---add/update caseforchange form --->
<cfform action="caseforchange_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="caseforchange_id" value="#caseforchange.caseforchange_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "200"><label> Case for Change </label></td>
		<td>
			<cfoutput>
				<textarea name="caseforchange_text" cols="40" rows="5" wrap="hard">#caseforchange_text#</textarea>
			</cfoutput>	
		</td>
	</tr>
	
	<tr>
		<td width = "200"><label> Case for Change Date </label></td>
		<td><cfinput type="text" name="caseforchange_date" value="#caseforchange_date#" message="must be a valid date" placeholder="mm/dd/yyyy" required="yes" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
	</tr>
	
	<tr>
		<td width = "200"><label> Project </label></td>
		<td><cfselect name="project_id" query="projects" value="project_id" display="project_name" selected="#VARIABLES.project_id#"></cfselect></td>
	</tr>
	
	<tr>
		<td width = "200"><label> User </label></td>
		<td><cfselect name="user_id" query="users" value="user_id" display="user_lastname" selected="#VARIABLES.user_id#"></cfselect></td>
	</tr>
	
	<tr>
		<td width = "200"><label> Version </label></td>
		<td><cfselect name="version_id" query="versions" value="version_id" display="version_name" selected="#VARIABLES.version_id#"></cfselect></td>
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




