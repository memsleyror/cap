

<!---get all projects --->
<cfinvoke component="projects" method="getmine" returnvariable="myprojects">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Home">
<cfset session.menuTracker.subMenuTitle = "My Projects">

<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
		
	</h1>
</div><!-- /.page-header -->

		
<!---  PAGE CONTENT BEGINS --->

		<div class="row">
				<div class="col-sm-6">
						
						
						<div class="table-responsive">
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

												<thead>
													<tr>
														<th>Project</th>
														
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="myprojects">
													<tr>
														<td><a href="project_dashboard.cfm?project_id=#project_id#">#project_name#</a></td>
														
														
													</tr>
													</cfoutput>
												</tbody>		

								</table>
						</div><!-- /.table-responsive -->
						
						<!---adding change manager view --->
						<div class="table-responsive">
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

												<thead>
													<tr>
														<th>Change Manager Dashboard View</th>
														
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="myprojects">
													<tr>
														<td><a href="change_manager_dashboard.cfm?project_id=#project_id#">#project_name#</a></td>
														
														
													</tr>
													</cfoutput>
												</tbody>		

								</table>
						</div><!-- /.table-responsive -->
						
						<!---adding temp change manager view --->
						<div class="table-responsive">
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

												<thead>
													<tr>
														<th>Temp Change Manager Dashboard View</th>
														
													</tr>
												</thead>
												
												<tbody>
													<cfoutput query="myprojects">
													<tr>
														<td><a href="temp_chgmgr_dashboard.cfm?project_id=#project_id#">#project_name#</a></td>
														
														
													</tr>
													</cfoutput>
												</tbody>		

								</table>
						</div><!-- /.table-responsive -->
						
				</div><!-- /span -->
		</div><!-- /row -->

<!---page footer --->
<cfinclude template="footer.cfm">

