
<!---check if projectfeed ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.projectfeed_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the projectfeed record --->
	<cfinvoke component="projectfeed" method="get" projectfeed_id="#URL.projectfeed_id#" returnvariable="projectfeed">
	
	<!---save to variables --->
	<cfset projectfeed_title=Trim(projectfeed.projectfeed_title)>
	<cfset projectfeed_text=Trim(projectfeed.projectfeed_text)>
	<cfset projectfeed_date=DateFormat(projectfeed.projectfeed_date,"MM/DD/YYYY")>
	<cfset user_id=projectfeed.user_id>
	<cfset project_id=projectfeed.project_id>
	<cfset feedtype_id=projectfeed.feedtype_id>
	
	<!---form text --->
	<cfset FormTitle="Update Project Feed">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset projectfeed_title="">
	<cfset projectfeed_text="">
	<cfset projectfeed_date="">
	<cfset user_id="">
	<cfset project_id="">
	<cfset feedtype_id="">
	
	<!---form text --->
	<cfset FormTitle="Add Project Feed">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get projects --->
<cfinvoke component="projectfeed" method="getProjects" returnvariable="projects"> 

<!---get users --->
<cfinvoke component="projectfeed" method="getUsers" returnvariable="users"> 

<!---get versions --->
<cfinvoke component="projectfeed" method="getFeedtypes" returnvariable="feedtypes"> 

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

<!---add/update projectfeed form --->
<cfform action="projectfeed_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="projectfeed_id" value="#projectfeed.projectfeed_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150">
			<label> Feed Title </label>
		</td>
		
		<td width = "150">
			<cfinput type="text"  name="projectfeed_title" value="#projectfeed_title#" id="form-field-1" message="feed title name is required" required="yes" validateAt="onSubmit,onServer" placeholder="Feed Title" />
		</td>
	</tr>
	
	<tr>
		<td width = "200"><label> Feed Text</label></td>
		<td>
			<cfoutput>
				<textarea name="projectfeed_text" cols="40" rows="5" wrap="hard">#projectfeed_text#</textarea>
			</cfoutput>	
		</td>
	</tr>
	
	<tr>
		<td width = "200"><label> Feed Date </label></td>
		<td><cfinput type="text" name="projectfeed_date" value="#projectfeed_date#" message="must be a valid date" placeholder="mm/dd/yyyy" required="yes" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
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
		<td width = "200"><label> Feed Type </label></td>
		<td><cfselect name="feedtype_id" query="feedtypes" value="feedtype_id" display="feedtype_name" selected="#VARIABLES.feedtype_id#"></cfselect></td>
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




