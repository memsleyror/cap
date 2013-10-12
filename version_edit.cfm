
<!---check if version ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.version_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the version record --->
	<cfinvoke component="versions" method="get" version_id="#URL.version_id#" returnvariable="version">
	
	<!---save to variables --->
	<cfset version_name=Trim(version.version_name)>
	
	
	<!---form text --->
	<cfset FormTitle="Update Version">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset version_name="">
	
	
	<!---form text --->
	<cfset FormTitle="Add Version">
	<cfset ButtonText="Insert">
	
</cfif>

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

<!---add/update version form --->
<cfform action="version_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="version_id" value="#version.version_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150"><label> Version </label></td>
		<td><cfinput type="text" name="version_name" value="#version_name#" message="version name is required" required="yes" placeholder="Version" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
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




