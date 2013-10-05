<!---get all companies --->
<cfinvoke component="companies" method="list" returnvariable="companies">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Global Settings">
<cfset session.menuTracker.subMenuTitle = "Companies">

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
														<th>Company</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="companies">
													<tr>
														<td>#company_name#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="company_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="company_edit.cfm?company_id=#company_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="company_delete.cfm?company_id=#company_id#">
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