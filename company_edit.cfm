
<!---check if company ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.company_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the company record --->
	<cfinvoke component="companies" method="get" company_id="#URL.company_id#" returnvariable="company">
	
	<!---save to variables --->
	<cfset company_name=Trim(company.company_name)>
	<cfset company_desc=Trim(company.company_desc)>
	
	
	<!---form text --->
	<cfset FormTitle="Update a company">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset company_name="">
	<cfset company_desc="">
	
	
	<!---form text --->
	<cfset FormTitle="Add a company">
	<cfset ButtonText="Insert">
	
</cfif>

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update company form --->
<cfform action="company_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="company_id" value="#company.company_id#">
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
		<td>company Name</td>
		<td><cfinput type="text" name="company_name" value="#company_name#" message="company name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
	</tr>
	
	<tr>
		<td>company Description</td>
		<td><cfinput type="text" name="company_desc" value="#company_desc#" message="company description is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></td>
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



