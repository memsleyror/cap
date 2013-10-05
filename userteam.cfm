

<!---get all userteams --->
<cfinvoke component="userteam" method="list" returnvariable="userteams">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "User-Team">

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
														<th>Team</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="userteams">
													<tr>
														<td>#user_lastname#</td>
														<td>#team_name#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="userteam_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="userteam_edit.cfm?userteam_id=#userteam_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="userteam_delete.cfm?userteam_id=#userteam_id#">
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
