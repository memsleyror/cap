﻿

<!---get all projects --->
<cfinvoke component="projects" method="list" returnvariable="projects">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "Projects">

<cfinclude template="header.cfm">

<div class="row">
	<div class="col-xs-6">
		
<!---  PAGE CONTENT BEGINS --->

		<div class="row">
				<div class="col-xs-12">
						<div class="table-responsive">
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

												<thead>
													<tr>
														<th>Project</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="projects">
													<tr>
														<td>#project_name#</td>
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
													</tr>
													</cfoutput>
												</tbody>		

								</table>
						</div><!-- /.table-responsive -->
				</div><!-- /span -->
		</div><!-- /row -->



<!---page footer --->
<cfinclude template="footer.cfm">
