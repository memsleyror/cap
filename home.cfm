

<!---get all projects --->
<cfinvoke component="projects" method="getmine" returnvariable="myprojects">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Home">
<cfset session.menuTracker.subMenuTitle = "My Projects">

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
	<div class="col-xs-4">
		
<!---  PAGE CONTENT BEGINS --->

		<div class="row">
				<div class="col-xs-12">
						<div class="table-responsive">
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

												<thead>
													<tr>
														<th>Project</th>
														<!--- <th>Action</th> --->
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="myprojects">
													<tr>
														<td><a href="project_dashboard.cfm?project_id=#project_id#">#project_name#</a></td>
														
														<!--- 
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="project_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="project_edit.cfm?project_id=#project_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="project_delete.cfm?project_id=#project_id#">
																	<i class="icon-trash bigger-130"></i>
																</a>
															</div>
														</td>
														--->
													</tr>
													</cfoutput>
												</tbody>		

								</table>
						</div><!-- /.table-responsive -->
				</div><!-- /span -->
		</div><!-- /row -->



<!---page footer --->
<cfinclude template="footer.cfm">

