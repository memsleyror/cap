
<!---check if usercompany ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.usercompany_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the usercompany record --->
	<cfinvoke component="usercompany" method="get" usercompany_id="#URL.usercompany_id#" returnvariable="usercompany">
	
	<!---save to variables --->
	<cfset user_id=usercompany.user_id>
	<cfset company_id=usercompany.company_id>
	
	<!---form text --->
	<cfset FormTitle="Update a Usercompany">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_id="">
	<cfset company_id="">
	
	<!---form text --->
	<cfset FormTitle="Add a Usercompany">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get companies --->
<cfinvoke component="usercompany" method="getCompanies" returnvariable="companies"> 

<!---get users --->
<cfinvoke component="usercompany" method="getUsers" returnvariable="users"> 

<!---page header --->
<cfinclude template="header.cfm">

<!---add/update usercompany form --->
<cfform action="usercompany_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="usercompany_id" value="#usercompany.usercompany_id#">
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
		<td>User</td>
		<td><cfselect name="user_id" query="users" value="user_id" display="user_lastname" selected="#VARIABLES.user_id#"></cfselect></td>
	</tr>
	
	<tr>
		<td>Company</td>
		<td><cfselect name="company_id" query="companies" value="company_id" display="company_name" selected="#VARIABLES.company_id#"></cfselect></td>
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



