

<!---get all userprojects --->
<cfinvoke component="userproject" method="list" returnvariable="userprojects">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "User-Project">

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
														<th>User</th>
														<th>Project</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="userprojects">
													<tr>
														<td>#user_lastname#</td>
														<td>#project_name#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="userproject_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="userproject_edit.cfm?userproject_id=#userproject_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="userproject_delete.cfm?userproject_id=#userproject_id#">
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





<!---page header --->
<cfinclude template="footer.cfm">
