
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
	<cfset FormTitle="Update User-Company">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_id="">
	<cfset company_id="">
	
	<!---form text --->
	<cfset FormTitle="Add User-Company">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get companies --->
<cfinvoke component="usercompany" method="getCompanies" returnvariable="companies"> 

<!---get users --->
<cfinvoke component="usercompany" method="getUsers" returnvariable="users"> 

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

<!---add/update usercompany form --->
<cfform action="usercompany_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="usercompany_id" value="#usercompany.usercompany_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150"><label> User </label></td>
		<td><cfselect name="user_id" query="users" value="user_id" display="user_lastname" selected="#VARIABLES.user_id#"></cfselect></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Company </label></td>
		<td><cfselect name="company_id" query="companies" value="company_id" display="company_name" selected="#VARIABLES.company_id#"></cfselect></td>
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
	




