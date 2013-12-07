
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

<!---get all feeds --->
<cfinvoke component="projectfeed" method="getProjFeeds" project_id="#session.proj.project_id#" returnvariable="projprojectfeeds">

	<!---save info to variables --->
	<cfset projectfeed_text=Trim(projprojectfeeds.projectfeed_text)>
	

<!--- get faqs for project --->
<cfset faqs = application.faqService.getAnsweredQuestions(session.proj.project_id)>

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
					<!--- Currently, I feel:<br>
					<cfoutput>#mood_name#</cfoutput>--->
					
				<table>	
				
				<tr><td align="center">
					<cfif mood_name Is "positive">
						<img alt="Bob Doe's Avatar" src="assets/images/positive_big.png" />
					<cfelseif mood_name Is "negative">	
						<img alt="Bob Doe's Avatar" src="assets/images/negative_big.png" />
					<cfelseif mood_name Is "confused">	
						<img alt="Bob Doe's Avatar" src="assets/images/confused_big.png" />	
					<cfelse>
						<img alt="Bob Doe's Avatar" src="assets/images/neutral_big.png" />		
					</cfif>
					
					<cfform action="projectmood_update.cfm" class="form-horizontal" role="form">
					
					<cfoutput>
						<input type="hidden" name="userprojectmood_id" value="#mymood.userprojectmood_id#">
					</cfoutput>
				</td></tr>	
					
					<!--- <cfselect name="mood_id" class="form-control" query="moods" value="mood_id" display="mood_name" <!--- selected="#VARIABLES.mood_id#"---> ></cfselect>--->
				<tr><td align="center">
						<INPUT TYPE="image" SRC="assets/images/positive.png" ALT="positive" value="save" NAME="button_pos"> 
						<INPUT TYPE="image" SRC="assets/images/negative.png" ALT="negative" value="save" NAME="button_neg"> 
						<INPUT TYPE="image" SRC="assets/images/confused.png" ALT="confused" value="save" NAME="button_confused"> 
						<INPUT TYPE="image" SRC="assets/images/neutral.png" ALT="neutral" value="save" NAME="button_neutral"> 
				</td></tr>	
						<!--- <button class="btn btn-success" name="button_pos" input type="submit">Positive</button>
						<button class="btn btn-danger" name="button_neg" input type="submit">Negative</button>
						<button class="btn btn-grey" name="button_confused" input type="submit">Confused</button>
						<button class="btn btn-yellow" name="button_neutral" input type="submit">Neutral</button>--->
					
					<!--- <button class="btn btn-purple">Purple</button>--->
					
					</cfform>
				</table>	
					
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
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="lighter smaller">
					<!--- <i class="icon-comment blue"></i> --->
					Project Feed
				</h4>
				
				<div class="widget-toolbar">
					<a href="#" data-action="collapse">
						<i class="icon-chevron-up"></i>
					</a>
				</div>
				
			</div>
				
				<div class="widget-body">
				
						<div class="widget-main padding-4">			
						
							<div class="timeline-container">
									<div class="timeline-label">
													<span class="label label-primary arrowed-in-right label-lg">
														<b>Today</b>
													</span>
									</div><!---timeline label --->
							
								<div class="timeline-items"><!---does not repeat --->

								<!---one timeline block starts here --->	
									<div class="timeline-item clearfix">
										
												<cfoutput query="projprojectfeeds">
										
														<div class="timeline-info">
															<i class="timeline-indicator icon-microphone btn btn-success no-hover"></i>
														</div>

														<div class="widget-box transparent">
															<div class="widget-header widget-header-small hidden"></div>

															<div class="widget-body">
																<div class="widget-main">
																	#projectfeed_text#
																	<div class="pull-right">
																		<i class="icon-time bigger-110"></i>
																		12:30
																	</div>
																</div>
															</div>
														</div>
														
												</cfoutput>		
									</div>
						
						
								<!---timeline block ends here --->
						
						
								</div><!---timeline items --->
							</div><!---timeline container --->
						</div><!--- /widget-main --->
				</div><!--- /widget-body --->
		</div><!--- /widget-box --->
	</div><!---span --->

</div><!---end of row 2 --->

<div class="hr hr32 hr-dotted"></div>

<!---third row begins --->
<div class="row">
	
	<!---third row, first cell --->
	<div class="col-sm-6">
		
		<div class="widget-box transparent" id="recent-box">
			
			<!---header open --->
			<div class="widget-header">
				<h4 class="lighter smaller">
					<!--- <i class="icon-comment blue"></i> --->
					FAQs
				</h4>
				
				<div class="widget-toolbar">
					<a href="#" data-action="collapse">
						<i class="icon-chevron-up"></i>
					</a>
				</div>
			</div><!---header close --->
			
			
			<div class="widget-body">
				
				<!---faq portion starts --->
			<div id="comment-tab" class="tab-pane">	
				<div class="comments">
					<div class="itemdiv commentdiv">
				
						<!--- <div class="itemdiv"> --->
							<br>
							<cfoutput query="faqs" maxrows="5">
								
								<div class="user">
									<img alt="Bob Doe's Avatar" src="assets/avatars/my_avatar.png" />
								</div>
								
								<div class="body">
									
									<div class="name">
										<!--- <a href="#">Bob Doe</a>--->
										#session.auth.user_firstname#  #session.auth.user_lastname#
									</div> 
									<!---close name --->
										
									<div class="time">
										<i class="icon-time"></i>
										<span class="green">#dateFormat(datecreated,"mmm d, yyyy")#</span>
									</div>	
									
									<div class="text">
										<i class="icon-quote-left"></i>
										<a href="faq.cfm?faq_id=#faq_id#&project_id=#session.proj.project_id#">#question#</a>
									</div>
								
								
									
									<!--- <div class=" hr"></div>--->
								
								</div> <!---close body --->
									
							
							</cfoutput>
						
						
						<!--- </div> --->
						
					</div><!---close itemdiv commentdiv --->	
				</div><!---close comments --->		
			</div><!---closes tab pane--->	
						
				<!---faq portion ends --->
			
				<cfoutput>
				<form method="post" action="faq.cfm?project_id=#session.proj.project_id#">
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

			</div><!---widget body --->
		</div><!---widget box --->
	</div><!---span --->

</div><!---end of third row --->



<!---these 2 divs close the entire page --->
	</div>
</div>

<!---page footer --->
<cfinclude template="footer.cfm">
