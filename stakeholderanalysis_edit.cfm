
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
	<cfset FormTitle="Add a Case for Change">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get stakeholdergroups --->
<cfinvoke component="stakeholderanalysis" method="getStakeholderGroups" returnvariable="stakeholdergroups"> 


<!---page header --->
<cfinclude template="header.cfm">

<!---add/update stakeholderanalysis form --->
<cfform action="stakeholderanalysis_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="stakeholderanalysis_id" value="#stakeholderanalysis.stakeholderanalysis_id#">
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
		<td>Stakeholder Impact</td>
		<td>
			<cfoutput>
				<textarea name="stakeholderanalysis_impact" cols="40" rows="5" wrap="hard">#stakeholderanalysis_impact#</textarea>
			</cfoutput>	
		</td>
	</tr>
	
	<tr>
		<td>Mitigation Strategy</td>
		<td>
			<cfoutput>
				<textarea name="stakeholderanalysis_strategy" cols="40" rows="5" wrap="hard">#stakeholderanalysis_strategy#</textarea>
			</cfoutput>	
		</td>
	</tr>
	
	<tr>
		<td>Analysis Date</td>
		<td><cfinput type="text" name="stakeholderanalysis_date" value="#stakeholderanalysis_date#" message="must be a valid date" required="yes" validateAt="onSubmit,onServer" size="10" maxlength="10"></td>
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



