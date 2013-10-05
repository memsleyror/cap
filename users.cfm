<!---get all users --->
<cfinvoke component="users" method="list" returnvariable="users">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Global Settings">
<cfset session.menuTracker.subMenuTitle = "Users">

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
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="users">
													<tr>
														<td>#user_lastname#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="user_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="user_edit.cfm?user_id=#user_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="user_delete.cfm?user_id=#user_id#">
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