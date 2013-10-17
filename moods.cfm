<!---get all moods --->
<cfinvoke component="moods" method="list" returnvariable="moods">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Global Settings">
<cfset session.menuTracker.subMenuTitle = "Moods">

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
														<th>Mood</th>
														<th>Action</th>
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="moods">
													<tr>
														<td>#mood_name#</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="blue" href="mood_edit.cfm">
																	<i class="icon-zoom-in bigger-130"></i>
																</a>

																<a class="green" href="mood_edit.cfm?mood_id=#mood_id#">
																	<i class="icon-pencil bigger-130"></i>
																</a>

																<a class="red" href="mood_delete.cfm?mood_id=#mood_id#">
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