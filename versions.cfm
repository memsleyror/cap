<!---get all versions --->
<cfinvoke component="versions" method="list" returnvariable="versions">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Global Settings">
<cfset session.menuTracker.subMenuTitle = "Versions">

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
														<th>Version</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="versions">
													<tr>
														<td>#version_name#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="version_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="version_edit.cfm?version_id=#version_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="version_delete.cfm?version_id=#version_id#">
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