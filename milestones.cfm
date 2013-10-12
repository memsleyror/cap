

<!---get all milestones --->
<cfinvoke component="milestones" method="list" returnvariable="milestones">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Project Setup">
<cfset session.menuTracker.subMenuTitle = "Milestones">

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
														<th>Milestone</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="milestones">
													<tr>
														<td>#milestone_name#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="milestone_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="milestone_edit.cfm?milestone_id=#milestone_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="milestone_delete.cfm?milestone_id=#milestone_id#">
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
