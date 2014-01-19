
<!---check if tasktype ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("URL.tasktype_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the tasktype record --->
	<cfinvoke component="tasktypes" method="get" tasktype_id="#URL.tasktype_id#" returnvariable="tasktype">
	
	<!---save to variables --->
	<cfset tasktype_name=Trim(tasktype.tasktype)>
	<cfset tasktype_label=Trim(tasktype.tasktype_label)>
	
	
	<!---form text --->
	<cfset FormTitle="Update Task Type">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset tasktype="">
	<cfset tasktype_label="">
	
	
	<!---form text --->
	<cfset FormTitle="Add Task Type">
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

<!---add/update tasktype form --->
<cfform action="tasktype_process.cfm">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="tasktype_id" value="#tasktype.tasktype_id#">
	</cfoutput>
</cfif>		

<fieldset>
<table>
	
	<tr>
		<td width = "150"><label> Task Type </label></td>
		<td><cfinput type="text" name="tasktype" value="#tasktype.tasktype#" message="tasktype is required" required="yes" placeholder="tasktype" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
	</tr>
	
	<tr>
		<td width = "150"><label> Task Type Label </label></td>
		<td><cfinput type="text" name="tasktype_label" value="#tasktype.tasktype_label#" message="tasktype label is required" required="yes" placeholder="tasktype label" validateAt="onSubmit,onServer" size="30" maxlength="100"></td>
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




