
<!---check if project_stat ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.project_stat_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the project_stat record --->
	<cfinvoke component="project_stats" method="get" project_stat_id="#URL.project_stat_id#" returnvariable="specific_project_stat">
	
	<!---save to variables --->
	<cfset project_stat_name=Trim(specific_project_stat.project_stat_name)>
	<cfset project_stat_note=Trim(specific_project_stat.project_stat_note)>
	<cfset project_stat_value=Trim(specific_project_stat.project_stat_value)>
	<cfset project_stat_style=Trim(specific_project_stat.project_stat_style)>
	<cfset project_id=specific_project_stat.project_id>
	
	
	<!---form text --->
	<cfset FormTitle="Update project_stat">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset project_stat_name="">
	<cfset project_stat_note="">
	<cfset project_stat_value="">
	<cfset project_stat_style="">
	<cfset project_id="">
	
	
	<!---form text --->
	<cfset FormTitle="Add project_stat">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get projects --->
<cfinvoke component="project_stats" method="getProjects" returnvariable="projects"> 

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
<div class="col-sm-5">
		
<!--- closes beginning of form structure --->					


<!---add/update project_stat form --->
<cfform action="project_stats_process.cfm" class="form-horizontal" project_stat="form">
						
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="project_stat_id" value="#specific_project_stat.project_stat_id#">
	</cfoutput>
</cfif>		

<fieldset>

<table>
	
	<tr>
		<td width = "200"><label> Project </label></td>
		<td><cfselect name="project_id" query="projects" value="project_id" display="project_name" selected="#VARIABLES.project_id#"></cfselect></td>
	</tr>
	
	
	<tr>
		<td width = "150">
			<label> Stat Name </label>
		</td>
		
		<td width = "150">
			<cfinput type="text"  name="project_stat_name" value="#project_stat_name#" id="form-field-1" message="project_stat name is required" required="yes" validateAt="onSubmit,onServer" placeholder="project_stat Name" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label> Stat Note </label>
		</td>
		
		<td>	
			<cfinput type="text" name="project_stat_note" value="#project_stat_note#" id="form-field-2" message="project_stat note is required" required="yes" validateAt="onSubmit,onServer" placeholder="project_stat Note" />
		</td>
	</tr>

	<tr>
		<td>
			<label> Stat Value </label>
		</td>
		
		<td>	
			<cfinput type="text" name="project_stat_value" value="#project_stat_value#" id="form-field-2" message="project_stat value is required" required="yes" validateAt="onSubmit,onServer" placeholder="project_stat Value" />
		</td>
	</tr>

	<tr>
		<td>
			<label> Stat Style </label>
		</td>
		
		<td>	
			<cfinput type="text" name="project_stat_style" value="#project_stat_style#" id="form-field-2" message="project_stat style is required" required="yes" validateAt="onSubmit,onServer" placeholder="project_stat Style" />
		</td>
	</tr>

</table>
</fieldset>

<br><br>
<!--- button part --->
	
	
			<!--- <div class="col-md-offset-3 col-md-9">--->
				<cfoutput>
				<button class="btn btn-info" input type="submit" value="#ButtonText#">
					<i class="icon-ok bigger-110"></i>
					#ButtonText#
				</button>
				</cfoutput>
	




</cfform>
<!---closes form structure --->
			
</div>

<!---page footer --->
<cfinclude template="footer.cfm">



