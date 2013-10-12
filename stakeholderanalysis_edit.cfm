
<!---check if stakeholderanalysis ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.stakeholderanalysis_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the stakeholderanalysis record --->
	<cfinvoke component="stakeholderanalysis" method="get" stakeholderanalysis_id="#URL.stakeholderanalysis_id#" returnvariable="stakeholderanalysis">
	
	<!---save to variables --->
	<cfset stakeholderanalysis_impact=Trim(stakeholderanalysis.stakeholderanalysis_impact)>
	<cfset stakeholderanalysis_strategy=Trim(stakeholderanalysis.stakeholderanalysis_strategy)>
	<cfset stakeholderanalysis_date=DateFormat(stakeholderanalysis.stakeholderanalysis_date,"MM/DD/YYYY")>
	<cfset stakeholdergroup_id=stakeholderanalysis.stakeholdergroup_id>
	
	
	<!---form text --->
	<cfset FormTitle="Update Stakeholder Analysis">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset stakeholderanalysis_impact="">
	<cfset stakeholderanalysis_strategy="">
	<cfset stakeholderanalysis_date="">
	<cfset stakeholdergroup_id="">

	
	<!---form text --->
	<cfset FormTitle="Add Stakeholder Analysis">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get stakeholdergroups --->
<cfinvoke component="stakeholderanalysis" method="getStakeholderGroups" returnvariable="stakeholdergroups"> 

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

<!---add/update stakeholderanalysis form --->
<cfform action="stakeholderanalysis_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="stakeholderanalysis_id" value="#stakeholderanalysis.stakeholderanalysis_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "200"><label> Stakeholder Impact </label></td>
		<td>
			<cfoutput>
				<textarea name="stakeholderanalysis_impact" cols="40" rows="5" wrap="hard">#stakeholderanalysis_impact#</textarea>
			</cfoutput>	
		</td>
	</tr>
	
	<tr>
		<td width = "200"><label> Mitigation Strategy </label></td>
		<td>
			<cfoutput>
				<textarea name="stakeholderanalysis_strategy" cols="40" rows="5" wrap="hard">#stakeholderanalysis_strategy#</textarea>
			</cfoutput>	
		</td>
	</tr>
	
	<tr>
		<td width = "200"><label> Analysis Date </label></td>
		<td><cfinput type="text" name="stakeholderanalysis_date" value="#stakeholderanalysis_date#" message="must be a valid date"  placeholder="mm/dd/yyyy" required="yes" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
	</tr>
	
	<tr>
		<td width = "200"><label> Stakeholder Group </label></td>
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



