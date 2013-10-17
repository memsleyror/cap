
<!---check if mood ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.mood_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the mood record --->
	<cfinvoke component="moods" method="get" mood_id="#URL.mood_id#" returnvariable="mood">
	
	<!---save to variables --->
	<cfset mood_name=Trim(mood.mood_name)>
	
	
	<!---form text --->
	<cfset FormTitle="Update Mood">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset mood_name="">
	
	
	<!---form text --->
	<cfset FormTitle="Add Mood">
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

<!---add/update mood form --->
<cfform action="mood_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="mood_id" value="#mood.mood_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150"><label> mood </label></td>
		<td><cfinput type="text" name="mood_name" value="#mood_name#" message="mood name is required" required="yes" placeholder="mood" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
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




