
<!---check if role ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.role_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the role record --->
	<cfinvoke component="roles" method="get" role_id="#URL.role_id#" returnvariable="role">
	
	<!---save to variables --->
	<cfset role_name=Trim(role.role_name)>
	<cfset role_desc=Trim(role.role_desc)>
	
	
	<!---form text --->
	<cfset FormTitle="Update Role">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset role_name="">
	<cfset role_desc="">
	
	
	<!---form text --->
	<cfset FormTitle="Add Role">
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
<div class="col-sm-5">
		<div class="widget-box">
			<div class="widget-header">
				<h4><cfoutput>#FormTitle#</cfoutput></h4>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
<!--- closes beginning of form structure --->					


<!---add/update role form --->
<cfform action="role_process.cfm" class="form-horizontal" role="form">
						
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="role_id" value="#role.role_id#">
	</cfoutput>
</cfif>		

<fieldset>

<table>
	<tr>
		<td width = "150">
			<label> Role Name </label>
		</td>
		
		<td width = "150">
			<cfinput type="text"  name="role_name" value="#role_name#" id="form-field-1" message="role name is required" required="yes" validateAt="onSubmit,onServer" placeholder="Role Name" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label> Role Description </label>
		</td>
		
		<td>	
			<cfinput type="text" name="role_desc" value="#role_desc#" id="form-field-2" message="role desc is required" required="yes" validateAt="onSubmit,onServer" placeholder="Role Description" />
		</td>
	</tr>

</table>
</fieldset>

<!--- button part --->
	
	<div class="form-actions center">
			<!--- <div class="col-md-offset-3 col-md-9">--->
				<cfoutput>
				<button class="btn btn-info" input type="submit" value="#ButtonText#">
					<i class="icon-ok bigger-110"></i>
					#ButtonText#
				</button>
				</cfoutput>
	</div>




</cfform>
<!---closes form structure --->
					
				</div>
			</div>
		</div>
</div>

<!---page footer --->
<cfinclude template="footer.cfm">



