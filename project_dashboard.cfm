
<!---first time in i am brining url.project_id --->
<!---next time i am not --->
<!--- set session = project id --->

<cfif IsDefined("URL.project_id")>
	<cfset session.proj.project_id = URL.project_id>
</cfif>	

<!---get the project record --->
	<cfinvoke component="projects" method="get" project_id="#session.proj.project_id#" returnvariable="project">

	<!---save info to variables --->
	<cfset project_name=Trim(project.project_name)>

<!---get the mood record --->
	<cfinvoke component="projects" method="getmood" project_id="#session.proj.project_id#" returnvariable="mymood">
	
	<!---save info to variables --->
	<cfset mood_name=Trim(mymood.mood_name)>
	<cfset mood_id=mymood.mood_id>
	
<!---get moods --->
<cfinvoke component="projects" method="getMoods" returnvariable="moods"> 	

<!--- get faqs for project --->
<cfset faqs = application.faqService.getAnsweredQuestions(url.project_id)>

<!---button caption --->
<cfset ButtonText="Update">	

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Home">
<cfset session.menuTracker.subMenuTitle = "Dashboard">

<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
		
		<small>
			<i class="icon-double-angle-right"></i>
			<cfoutput>#project_name#</cfoutput>
			<!---<cfoutput> #FormTitle#</cfoutput>--->
		</small>
		
	</h1>
</div><!-- /.page-header -->

<!---assuming this sets up the entire page --->
<div class="row">
	<div class="col-xs-12">

<!--- PAGE CONTENT BEGINS --->

<!---first row begins --->
<div class="row">
	
	<!---first row, first cell --->
	<div class="col-sm-6">
		<div class="widget-box ">
			<div class="widget-header">
				<h4 class="lighter smaller">
					<!--- <i class="icon-comment blue"></i> --->
					Purpose of the Project
				</h4>
			</div>
				
				<div class="widget-body">
				
						<div class="widget-main padding-4">			
						<blockquote>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>

							<small>
								Someone famous
								<cite title="Source Title">Source Title</cite>
							</small>
						</blockquote>
						
	
						</div><!--- /widget-main --->
				</div><!--- /widget-body --->
		</div><!--- /widget-box --->
	</div><!---span --->


	<!---first row, second cell --->
	<div class="col-sm-6">
		<div class="widget-box transparent">
			<div class="widget-header widget-header-flat">
				<h4 class="lighter">
					<!--- <i class="icon-signal"></i> --->
					How I Feel About This Project
				</h4>

				<div class="widget-toolbar">
					<a href="#" data-action="collapse">
						<i class="icon-chevron-up"></i>
					</a>
				</div>
			</div>

			<div class="widget-body">
				<div class="widget-main padding-4">
					Currently, I feel:<br>
					<cfoutput>#mood_name#</cfoutput><br><br>
					
					<cfform action="projectmood_update.cfm" class="form-horizontal" role="form">
					
					<cfoutput>
						<input type="hidden" name="userprojectmood_id" value="#mymood.userprojectmood_id#">
					</cfoutput>
					
					<!--- <cfselect name="mood_id" class="form-control" query="moods" value="mood_id" display="mood_name" <!--- selected="#VARIABLES.mood_id#"---> ></cfselect>--->
					
					
						<button class="btn btn-success" name="button_pos" input type="submit">Positive</button>
						<button class="btn btn-danger" name="button_neg" input type="submit">Negative</button>
						<button class="btn btn-grey" name="button_confused" input type="submit">Confused</button>
						<button class="btn btn-yellow" name="button_neutral" input type="submit">Neutral</button>
					
					<!--- <button class="btn btn-purple">Purple</button>--->
					
					</cfform>
					
				</div><!--- /widget-main --->
			</div><!--- /widget-body --->
		</div><!--- /widget-box --->
	</div><!---span --->

</div><!---end of row 1 --->

<div class="hr hr32 hr-dotted"></div>

<!---second row begins --->
<div class="row">
	
	<!---second row, first cell --->
	<div class="col-sm-6">
		<div class="widget-box transparent">
						<div class="widget-header widget-header-flat">
							<h4 class="lighter">
								<!--- <i class="icon-signal"></i> --->
								My Tasks
							</h4>
							
							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="icon-chevron-up"></i>
								</a>
							</div>
						</div><!---/widget header --->

			<div class="widget-body">
					<div class="widget-main padding-4">
				
				
				
					</div><!--- /widget-main --->
			</div><!--- /widget-body --->
		</div><!--- /widget-box --->
	</div><!---span --->

	<!---second row, second cell --->
	<div class="col-sm-6">
		<div class="widget-box ">
			<div class="widget-header">
				<h4 class="lighter smaller">
					<!--- <i class="icon-comment blue"></i> --->
					Project Feed
				</h4>
			</div>
				
				<div class="widget-body">
				
						<div class="widget-main padding-4">			
						
						
	
						</div><!--- /widget-main --->
				</div><!--- /widget-body --->
		</div><!--- /widget-box --->
	</div><!---span --->

</div><!---end of row 2 --->


<div class="row">
	<div class="col-sm-6">
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="lighter smaller">
					<i class="icon-comment blue"></i>
					FAQs
				</h4>
			</div>
			<div class="widget-body">
				<div class="itemdiv">
					<cfoutput query="faqs">
						<div class="text">
							<i class="icon-quote-left"></i>
							<a href="faq.cfm?faq_id=#faq_id#&project_id=#url.project_id#">#question#</a>
						</div>
					</cfoutput>
				</div>
			
				<cfoutput>
				<form method="post" action="faq.cfm?project_id=#url.project_id#">
					<div class="form-actions">
						<div class="input-group">
							<input placeholder="Type your question here ..." type="text" class="form-control" name="newfaq" />
							<span class="input-group-btn">
								<button class="btn btn-sm btn-info no-radius" type="submit">
									<i class="icon-share-alt"></i>
									Submit
								</button>
							</span>
						</div>
					</div>
				</form>
				</cfoutput>

			</div>
		</div>
	</div>
</div>



<!---these 2 divs close the entire page --->
	</div>
</div>

<!---page footer --->
<cfinclude template="footer.cfm">
