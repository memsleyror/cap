
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
	<cfset FormTitle="Update a Version">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset version_name="">
	
	
	<!---form text --->
	<cfset FormTitle="Add a Version">
	<cfset ButtonText="Insert">
	
</cfif>

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update version form --->
<cfform action="version_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="version_id" value="#version.version_id#">
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
		<td>Version Name</td>
		<td><cfinput type="text" name="version_name" value="#version_name#" message="version name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
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



