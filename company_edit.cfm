
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
	<cfset FormTitle="Update Company">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset company_name="">
	<cfset company_desc="">
	
	
	<!---form text --->
	<cfset FormTitle="Add Company">
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

<!---add/update company form --->
<cfform action="company_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="company_id" value="#company.company_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150"><label> Company Name </label></td>
		<td><cfinput type="text" name="company_name" value="#company_name#" message="company name is required" required="yes" placeholder="Company Name" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Company Description </label></td>
		<td><cfinput type="text" name="company_desc" value="#company_desc#" message="company description is required" required="yes" placeholder="Company Description" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
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



