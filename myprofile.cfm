
<!--- breadcrumb settings                                                               --->
<cfset session.menuTracker.menuTitle = "Global Settings">
<cfset session.menuTracker.subMenuTitle = "My Profile">


<!---check if user ID was provided --->
<!---if yes, edit, else add --->

<cfset EditMode=IsDefined("session.auth.user_id")>

<!---if edit mode then get row to edit --->
<cfif EditMode>
	
	<!---get the user record --->
	<cfinvoke component="users" method="get" user_id="#session.auth.user_id#" returnvariable="user">
	
	<!---save to variables --->
	<cfset user_login=Trim(user.user_login)>
	<cfset user_password=Trim(user.user_password)>
	<cfset user_firstname=Trim(user.user_firstname)>
	<cfset user_lastname=Trim(user.user_lastname)>
	<cfset user_email=Trim(user.user_email)>
	<cfset role_id=user.role_id>
	<cfset user_default_project_id=user.user_default_project_id>
	
	<!---form text --->
	<cfset FormTitle="Update My Profile">
	<cfset ButtonText="Update">
	
<cfelse>
	
	<!---save to variables --->
	<cfset user_login="">
	<cfset user_password="">
	<cfset user_firstname="">
	<cfset user_lastname="">
	<cfset user_email="">
	<cfset role_id="">
	<cfset user_default_project_id="">
	
	
	<!---form text --->
	<cfset FormTitle="Add a User">
	<cfset ButtonText="Insert">
	
</cfif>

<!---get roles --->
<cfinvoke component="users" method="getRoles" returnvariable="roles"> 

<!---get user projects 
<cfinvoke component="users" method="getUserProjects" returnvariable="userProjects"> 
--->

<!---page header --->
<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
		<small>
			<i class="icon-double-angle-right"></i>
			<cfoutput>#FormTitle#</cfoutput>
		</small>
	</h1>
</div><!-- /.page-header -->


<!---add/update user form --->
<cfform action="user_process.cfm" enctype="multipart/form-data">
	
<cfif EditMode>
	<!---embed primary key as hidden field --->
	<cfoutput>
		<input type="hidden" name="user_id" value="#user.user_id#">
	</cfoutput>
</cfif>		


		<div id="user-profile-2" class="user-profile">
				
											

			<div class="tab-content no-border padding-24">
				<div id="home" class="tab-pane in active">
					<div class="row">
						<div class="col-xs-12 col-sm-3 center">
							<span class="profile-picture">
								<img class="editable img-responsive" alt="Alex's Avatar" id="avatar2" 
								<cfif len(session.auth.image_file)>
									<cfoutput>
								src="images/profiles/#session.auth.image_file#"
									</cfoutput>
								<cfelse>
								src="assets/avatars/avatar2.png"
								</cfif>
								 />
							</span>

							<div class="space space-4"></div>

							<a href="#" class="btn btn-sm btn-block btn-success">
								<i class="icon-plus-sign bigger-120"></i>
								<span class="bigger-110">Add as a friend</span>
							</a>

							<a href="#" class="btn btn-sm btn-block btn-primary">
								<i class="icon-envelope-alt bigger-110"></i>
								<span class="bigger-110">Send a message</span>
							</a>
						</div><!-- /span -->

						<div class="col-xs-12 col-sm-9">
							<h4 class="blue">
								<span class="middle">Alex M. Doe</span>

								<span class="label label-purple arrowed-in-right">
									<i class="icon-circle smaller-80 align-middle"></i>
									online
								</span>
							</h4>

							<div class="profile-user-info">
								<div class="profile-info-row">
									<div class="profile-info-name"> Login </div>

									<div class="profile-info-value">
										<span><cfinput type="text" name="user_login" value="#user_login#" message="user login is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Password </div>

									<div class="profile-info-value">
										<span><cfinput type="text" name="user_password" value="#user_password#" message="user password is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> First Name </div>

									<div class="profile-info-value">
										<span><cfinput type="text" name="user_firstname" value="#user_firstname#" message="user first name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></span>
									</div>
								</div>
																
								<div class="profile-info-row">
									<div class="profile-info-name"> Last Name </div>

									<div class="profile-info-value">
										<span><cfinput type="text" name="user_lastname" value="#user_lastname#" message="user last name is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Email </div>

									<div class="profile-info-value">
										<span><cfinput type="text" name="user_email" value="#user_email#" message="user email is required" required="yes" validateAt="onSubmit,onServer" size="50" maxlength="100"></span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Role </div>

									<div class="profile-info-value">
										<span><cfselect name="role_id" query="roles" value="role_id" display="role_name" selected="#VARIABLES.role_id#"></cfselect></span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> New Image </div>

									<div class="profile-info-value">
										<span><input type="file" name="newimage" accept="image/*"></span>
									</div>
								</div>

							</div>

															<div class="hr hr-8 dotted"></div>

															<div class="profile-user-info">
																<div class="profile-info-row">
																	<div class="profile-info-name"> Update </div>

																	<div class="profile-info-value">
																		<cfoutput>
																			<button class="btn btn-info" input type="submit" value="#ButtonText#">
																				<i class="icon-ok bigger-110"></i>
																				#ButtonText#
																			</button>
																		</cfoutput>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">
																		<i class="middle icon-facebook-sign bigger-150 blue"></i>
																	</div>

																	<div class="profile-info-value">
																		<a href="#">Find me on Facebook</a>
																	</div>
																</div>

																<div class="profile-info-row">
																	<div class="profile-info-name">
																		<i class="middle icon-twitter-sign bigger-150 light-blue"></i>
																	</div>

																	<div class="profile-info-value">
																		<a href="#">Follow me on Twitter</a>
																	</div>
																</div>
															</div>
														</div><!-- /span -->
													</div><!-- /row-fluid -->

													<div class="space-20"></div>

													<div class="row">
														<div class="col-xs-12 col-sm-6">
															<div class="widget-box transparent">
																<div class="widget-header widget-header-small">
																	<h4 class="smaller">
																		<i class="icon-check bigger-110"></i>
																		Little About Me
																	</h4>
																</div>

																<div class="widget-body">
																	<div class="widget-main">
																		<p>
																			My job is mostly lorem ipsuming and dolor sit ameting as long as consectetur adipiscing elit.
																		</p>
																		<p>
																			Sometimes quisque commodo massa gets in the way and sed ipsum porttitor facilisis.
																		</p>
																		<p>
																			The best thing about my job is that vestibulum id ligula porta felis euismod and nullam quis risus eget urna mollis ornare.
																		</p>
																		<p>
																			Thanks for visiting my profile.
																		</p>
																	</div>
																</div>
															</div>
														</div>

														<div class="col-xs-12 col-sm-6">
															<div class="widget-box transparent">
																<div class="widget-header widget-header-small header-color-blue2">
																	<h4 class="smaller">
																		<i class="icon-lightbulb bigger-120"></i>
																		My Skills
																	</h4>
																</div>

																<div class="widget-body">
																	<div class="widget-main padding-16">
																		<div class="clearfix">
																			<div class="grid3 center">
																				<div class="easy-pie-chart percentage" data-percent="45" data-color="#CA5952">
																					<span class="percent">45</span>%
																				</div>

																				<div class="space-2"></div>
																				Graphic Design
																			</div>

																			<div class="grid3 center">
																				<div class="center easy-pie-chart percentage" data-percent="90" data-color="#59A84B">
																					<span class="percent">90</span>%
																				</div>

																				<div class="space-2"></div>
																				HTML5 & CSS3
																			</div>

																			<div class="grid3 center">
																				<div class="center easy-pie-chart percentage" data-percent="80" data-color="#9585BF">
																					<span class="percent">80</span>%
																				</div>

																				<div class="space-2"></div>
																				Javascript/jQuery
																			</div>
																		</div>

																		<div class="hr hr-16"></div>

																		<div class="profile-skills">
																			<div class="progress">
																				<div class="progress-bar" style="width:80%">
																					<span class="pull-left">HTML5 & CSS3</span>
																					<span class="pull-right">80%</span>
																				</div>
																			</div>

																			<div class="progress">
																				<div class="progress-bar progress-bar-success" style="width:72%">
																					<span class="pull-left">Javascript & jQuery</span>

																					<span class="pull-right">72%</span>
																				</div>
																			</div>

																			<div class="progress">
																				<div class="progress-bar progress-bar-purple" style="width:70%">
																					<span class="pull-left">PHP & MySQL</span>

																					<span class="pull-right">70%</span>
																				</div>
																			</div>

																			<div class="progress">
																				<div class="progress-bar progress-bar-warning" style="width:50%">
																					<span class="pull-left">Wordpress</span>

																					<span class="pull-right">50%</span>
																				</div>
																			</div>

																			<div class="progress">
																				<div class="progress-bar progress-bar-danger" style="width:35%">
																					<span class="pull-left">Photoshop</span>

																					<span class="pull-right">35%</span>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div><!-- #home -->									
			</div><!---tab content --->
		
	</div><!---user profile 2 --->


</cfform>



<!---page footer --->
<cfinclude template="footer.cfm">
