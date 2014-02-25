

<!---get all tasks --->
<cfinvoke component="#application.taskservice#" method="list" returnvariable="tasks">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Manage Phase">
<cfset session.menuTracker.subMenuTitle = "Project Tasks">



<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
		<!--- 
		<small>
			<i class="icon-double-angle-right"></i>
			<cfoutput>#FormTitle#</cfoutput>
		</small>
		--->
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-6">
		
<!---  PAGE CONTENT BEGINS --->

		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

						<thead>
							<tr>
								<th>Task</th>
								<th>User</th>
								<th>Action</th>
							</tr>
						</thead>
												
						<tbody>
							<cfoutput query="tasks">
							<tr>
								<td>#task_desc#</td>
								<td>#user_login#</td>
								<td>
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">

										<a class="green" href="task_edit.cfm?task_id=#task_id#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="task_delete.cfm?task_id=#task_id#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>
								</td>
							</tr>
							</cfoutput>
						</tbody>		

					</table>
					<a href="task_edit.cfm">Add New</a><br>
			</div><!-- /.table-responsive -->
		</div><!-- /span -->
</div><!-- /row -->



<!---page footer --->
<cfinclude template="footer.cfm">
