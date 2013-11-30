
<!---check if feedtype ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.feedtype_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the feedtype record --->
	<cfinvoke component="feedtypes" method="get" feedtype_id="#URL.feedtype_id#" returnvariable="feedtype">
	
	<!---save to variables --->
	<cfset feedtype_name=Trim(feedtype.feedtype_name)>
	<cfset feedtype_icon=Trim(feedtype.feedtype_icon)>
	
	
	<!---form text --->
	<cfset FormTitle="Update Feedtype">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset feedtype_name="">
	<cfset feedtype_icon="">
	
	
	<!---form text --->
	<cfset FormTitle="Add Feedtype">
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
		
<!--- closes beginning of form structure --->					


<!---add/update feedtype form --->
<cfform action="feedtype_process.cfm" class="form-horizontal" feedtype="form">
						
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="feedtype_id" value="#feedtype.feedtype_id#">
	</cfoutput>
</cfif>		

<fieldset>

<table>
	<tr>
		<td width = "150">
			<label> Feedtype Name </label>
		</td>
		
		<td width = "150">
			<cfinput type="text"  name="feedtype_name" value="#feedtype_name#" id="form-field-1" message="feedtype name is required" required="yes" validateAt="onSubmit,onServer" placeholder="feedtype Name" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label> Feedtype Icon </label>
		</td>
		
		<td>	
			<cfinput type="text" name="feedtype_icon" value="#feedtype_icon#" id="form-field-2" message="feedtype desc is required" required="yes" validateAt="onSubmit,onServer" placeholder="feedtype Description" />
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



