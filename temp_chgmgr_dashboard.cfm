
<cfif IsDefined("URL.project_id")>
	<cfset session.proj.project_id = URL.project_id>
</cfif>	

<!---get average mood score --->	
	<cfinvoke component="projects" method="getavgmood" project_id="#session.proj.project_id#" returnvariable="avgmood">
	
		<!---save info to variables --->
		<cfset avgmoodscore=avgmood.AVG_MOOD>	

<!---get average mood score --->	
	<cfinvoke component="projects" method="getmoodcounts" project_id="#session.proj.project_id#" returnvariable="moodcounts">
	
<!---get last week's faqs --->	
	<cfinvoke component="projects" method="getlastweekfaqs" project_id="#session.proj.project_id#" returnvariable="lastweekfaqs">	
	
<!---get open faqs --->	
	<cfinvoke component="projects" method="getopenfaqs" project_id="#session.proj.project_id#" returnvariable="openfaqs">		
	
<!---get task completion --->	
	<cfinvoke component="projects" method="gettaskcompletion" project_id="#session.proj.project_id#" returnvariable="taskcompletion">		
		

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Home">
<cfset session.menuTracker.subMenuTitle = "Temp Change Manager Dashboard">



<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
		
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-6">
		
<!---  PAGE CONTENT BEGINS --->

		<div class="row">
			<div class="col-xs-12">
				Average Mood Score
				<div class="table-responsive">
					<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

						<thead>
							<tr>
								<th>KPI</th>
								<th>Value</th>
							</tr>
						</thead>
												
						<tbody>
							
							<tr>
								<td>Average Mood Score</td>
								<cfoutput><td>#avgmoodscore#</td></cfoutput>
								
							</tr>
						</tbody>		

					</table>
					
			</div><!-- /.table-responsive -->
			
			Mood Count
			<div class="table-responsive">
					<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

						<thead>
							<tr>
								<th>KPI</th>
								<th>Value</th>
							</tr>
						</thead>
												
						<tbody>
							<cfoutput query="moodcounts">
							<tr>
								<td>#mood_name#</td>
								<td>#mood_count#</td>
							</tr>
							</cfoutput>
						</tbody>			

					</table>
					
			</div><!-- /.table-responsive -->
			
			Last Week's FAQs
			<div class="table-responsive">
					<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

						<thead>
							<tr>
								<th>Question</th>
								<th>Date Created</th>
							</tr>
						</thead>
												
						<tbody>
							<cfoutput query="lastweekfaqs">
							<tr>
								<td>#question#</td>
								<td>#datecreated#</td>
							</tr>
							</cfoutput>
						</tbody>			

					</table>
					
			</div><!-- /.table-responsive -->
			
			
			Unanswered FAQs
			<div class="table-responsive">
					<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

						<thead>
							<tr>
								<th>Question</th>
								<th>Date Created</th>
							</tr>
						</thead>
												
						<tbody>
							<cfoutput query="openfaqs">
							<tr>
								<td>#question#</td>
								<td>#datecreated#</td>
							</tr>
							</cfoutput>
						</tbody>			

					</table>
					
			</div><!-- /.table-responsive -->
			
			Task Completion
			<div class="table-responsive">
					<table id="sample-table-1" class="table table-striped table-bordered table-hover">						

						<thead>
							<tr>
								<th>Task Description</th>
								<th>Completed?</th>
								<th>Count</th>
							</tr>
						</thead>
												
						<tbody>
							<cfoutput query="taskcompletion">
							<tr>
								<td>#task_desc#</td>
								<td>#completed#</td>
								<td>#task_count#</td>
							</tr>
							</cfoutput>
						</tbody>			

					</table>
					
			</div><!-- /.table-responsive -->
			
		</div><!-- /span -->
</div><!-- /row -->



<!---page footer --->
<cfinclude template="footer.cfm">
