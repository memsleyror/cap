<!---get all project stats --->
<cfinvoke component="project_stats" method="list" returnvariable="all_project_stats">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Manage Phase">
<cfset session.menuTracker.subMenuTitle = "Project Stats">



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
														<th>Project Name</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="all_project_stats">
													<tr>
														<td>#project_name#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="project_stat_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="project_stats_edit.cfm?project_stat_id=#project_stat_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="project_stats_delete.cfm?project_stat_id=#project_stat_id#">
																	<i class="icon-trash bigger-130"></i>
																</a>
															</div>
														</td>
													</tr>
													</cfoutput>
												</tbody>		

								</table>
								<a href="project_stats_edit.cfm">Add New</a><br>
						</div><!-- /.table-responsive -->
				</div><!-- /span -->
		</div><!-- /row -->



<!---page footer --->
<cfinclude template="footer.cfm">
