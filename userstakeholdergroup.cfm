

<!---get all userstakeholdergroups --->
<cfinvoke component="userstakeholdergroup" method="list" returnvariable="userstakeholdergroups">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "User-Stakeholder Group">

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
														<th>Stakeholder Group</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="userstakeholdergroups">
													<tr>
														<td>#user_lastname#</td>
														<td>#stakeholdergroup_name#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="userstakeholdergroup_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="userstakeholdergroup_edit.cfm?userstakeholdergroup_id=#userstakeholdergroup_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="userstakeholdergroup_delete.cfm?userstakeholdergroup_id=#userstakeholdergroup_id#">
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
