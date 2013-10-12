

<!---get all casesforchange --->
<cfinvoke component="stakeholderanalysis" method="list" returnvariable="stakeholderanalyses">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Prepare Phase">
<cfset session.menuTracker.subMenuTitle = "Stakeholder Analysis">

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

<div class="row">
				<div class="col-xs-12">
						<div class="table-responsive">
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

												<thead>
													<tr>
														<th>ID</th>
														<th>Stakeholder Group</th>
														<th>Date</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="stakeholderanalyses">
													<tr>
														<td>#stakeholderanalysis_id#</td>
														<td>#stakeholdergroup_name#</td>
														<td>#DateFormat(stakeholderanalysis_date, "MM/DD/YYYY")#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="stakeholderanalysis_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="stakeholderanalysis_edit.cfm?stakeholderanalysis_id=#stakeholderanalysis_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="stakeholderanalysis_delete.cfm?stakeholderanalysis_id=#stakeholderanalysis_id#">
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
