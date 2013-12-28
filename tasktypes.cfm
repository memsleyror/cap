<!---get all tasktypes --->
<cfinvoke component="tasktypes" method="list" returnvariable="tasktypes">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Global Settings">
<cfset session.menuTracker.subMenuTitle = "Task Types">

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
														<th>Task Type</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="tasktypes">
													<tr>
														<td>#tasktype#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="tasktype_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="tasktype_edit.cfm?tasktype_id=#tasktype_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="tasktype_delete.cfm?tasktype_id=#tasktype_id#">
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