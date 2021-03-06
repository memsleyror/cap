﻿<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Change Agent Pro</title>

		<meta name="description" content="Static &amp; Dynamic Tables" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->

		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

		<link rel="stylesheet" href="assets/css/ace-fonts.css" />

		<!-- ace styles -->

		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="assets/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

		<!--- session variables to make page selection dynamic --->
		
		<cfif not isDefined("session.menuTracker")>
			<cfset session.menuTracker = structNew()>
			<cfset session.menuTracker.menuTitle = "">
			<cfset session.menuTracker.subMenuTitle = "">
		</cfif>	
		
	</head>

	<body>
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<!--- <i class="icon-leaf"></i> --->
							Change Agent Pro
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>

							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-ok"></i>
									4 Tasks to Complete
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Software Update</span>
											<span class="pull-right">65%</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:65%" class="progress-bar "></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Hardware Upgrade</span>
											<span class="pull-right">35%</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:35%" class="progress-bar progress-bar-danger"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Unit Testing</span>
											<span class="pull-right">15%</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:15%" class="progress-bar progress-bar-warning"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Bug Fixes</span>
											<span class="pull-right">90%</span>
										</div>

										<div class="progress progress-mini progress-striped active">
											<div style="width:90%" class="progress-bar progress-bar-success"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										See tasks with details
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="purple">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-bell-alt icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>

							<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-warning-sign"></i>
									8 Projects
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-pink icon-comment"></i>
												New Comments
											</span>
											<span class="pull-right badge badge-info">+12</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<i class="btn btn-xs btn-primary icon-user"></i>
										Bob just signed up as an editor ...
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
												New Orders
											</span>
											<span class="pull-right badge badge-success">+8</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-info icon-twitter"></i>
												Followers
											</span>
											<span class="pull-right badge badge-info">+11</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										See all notifications
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="green">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>

							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-envelope-alt"></i>
									FAQ: 5 New Messages
								</li>

								<li>
									<a href="#">
										<img src="assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Alex:</span>
												Ciao sociis natoque penatibus et auctor ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>a moment ago</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="#">
										<img src="assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Susan:</span>
												Vestibulum id ligula porta felis euismod ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>20 minutes ago</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="#">
										<img src="assets/avatars/my_avatar.png" class="msg-photo" alt="Bob's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Bob:</span>
												Nullam quis risus eget urna mollis ornare ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>3:15 pm</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="inbox.html">
										See all messages
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<cfoutput>
								<cfif len(session.auth.image_file)>
								<img class="nav-user-photo" src="images/profiles/#session.auth.image_file#" alt="#session.auth.user_firstname#'s Photo" />
								<cfelse>
								<img class="nav-user-photo" src="assets/avatars/avatar2.png" alt="#session.auth.user_firstname#'s Photo" />
								</cfif>
								<span class="user-info">
									<small>Welcome,</small>
									#session.auth.user_firstname#
								</span>
								</cfoutput>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="globalsettingsmain.cfm">
										<i class="icon-cog"></i>
										Global Settings
									</a>
								</li>

								<li>
									<a href="myprofile.cfm">
										<i class="icon-user"></i>
										Profile
									</a>
								</li>
								
							

								<li class="divider"></li>

								<li>
									<a href="logout.cfm">
										<i class="icon-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						
						<!---shortcut icons at top of sidebar 
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>

							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>
						

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
						--->
					</div><!-- #sidebar-shortcuts -->
					

					<ul class="nav nav-list">
						
						<li>
							<a href="home.cfm">
								<i class="icon-text-width"></i>
								<span class="menu-text"> My Projects </span>
							</a>
						</li>
						
						
						<li>
							<a href="index.html">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> Dashboard </span>
							</a>
						</li>

						

				<cfif session.menuTracker.menuTitle is "Project Setup">
						<li class="active open">
				<cfelse>			
						<li>
				</cfif>			
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text"> Project Setup </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<cfif session.menuTracker.subMenuTitle is "Projects">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="projects.cfm">
										<i class="icon-double-angle-right"></i>
										Project Info
									</a>
								</li>

								<cfif session.menuTracker.subMenuTitle is "Milestones">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="milestones.cfm">
										<i class="icon-double-angle-right"></i>
										Project Milestones
									</a>
								</li>

								<cfif session.menuTracker.subMenuTitle is "Roles">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="roles.cfm">
										<i class="icon-double-angle-right"></i>
										Roles
									</a>
								</li>

								<cfif session.menuTracker.subMenuTitle is "User-Project">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="userproject.cfm">
										<i class="icon-double-angle-right"></i>
										User-Project
									</a>
								</li>

								<cfif session.menuTracker.subMenuTitle is "Teams">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="teams.cfm">
										<i class="icon-double-angle-right"></i>
										Teams
									</a>
								</li>
								
								<cfif session.menuTracker.subMenuTitle is "User-Team">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="userteam.cfm">
										<i class="icon-double-angle-right"></i>
										User-Team
									</a>
								</li>
								
								<cfif session.menuTracker.subMenuTitle is "Stakeholder Groups">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="stakeholdergroups.cfm">
										<i class="icon-double-angle-right"></i>
										Stakeholder Groups
									</a>
								</li>
								
								<cfif session.menuTracker.subMenuTitle is "User-Stakeholder Group">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="userstakeholdergroup.cfm">
										<i class="icon-double-angle-right"></i>
										User-Stakeholder Group
									</a>
								</li>

								<!--- 
								<li>
									<a href="#" class="dropdown-toggle">
										<i class="icon-double-angle-right"></i>

										Three Level Menu
										<b class="arrow icon-angle-down"></b>
									</a>

									<ul class="submenu">
										<li>
											<a href="#">
												<i class="icon-leaf"></i>
												Item #1
											</a>
										</li>

										<li>
											<a href="#" class="dropdown-toggle">
												<i class="icon-pencil"></i>

												4th level
												<b class="arrow icon-angle-down"></b>
											</a>

											<ul class="submenu">
												<li>
													<a href="#">
														<i class="icon-plus"></i>
														Add Product
													</a>
												</li>

												<li>
													<a href="#">
														<i class="icon-eye-open"></i>
														View Products
													</a>
												</li>
											</ul>
										</li>
									</ul>
								</li> 
								--->
							</ul>
						</li>

						<cfif session.menuTracker.menuTitle is "Prepare Phase">
							<li class="active open">
						<cfelse>			
							<li>
						</cfif>				
							
							<a href="#" class="dropdown-toggle">
								<i class="icon-list"></i>
								<span class="menu-text"> Prepare Phase </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<cfif session.menuTracker.subMenuTitle is "Case for Change">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="caseforchange.cfm">
										<i class="icon-double-angle-right"></i>
										Case For Change
									</a>
								</li>

								<cfif session.menuTracker.subMenuTitle is "Stakeholder Analysis">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="stakeholderanalysis.cfm">
										<i class="icon-double-angle-right"></i>
										Stakeholder Analysis
									</a>
								</li>
							</ul>
						</li>
						
						<cfif session.menuTracker.menuTitle is "Manage Phase">
							<li class="active open">
						<cfelse>			
							<li>
						</cfif>			

							<a href="#" class="dropdown-toggle">
								<i class="icon-edit"></i>
								<span class="menu-text"> Manage Phase </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<cfif session.menuTracker.subMenuTitle is "Project Feed">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="projectfeed.cfm">
										<i class="icon-double-angle-right"></i>
										Project Feed
									</a>
								</li>
								
								<cfif session.menuTracker.subMenuTitle is "Project Tasks">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="tasks.cfm">
										<i class="icon-double-angle-right"></i>
										Tasks
									</a>
								</li>
								
								<cfif session.menuTracker.subMenuTitle is "Project Stats">
									<li class="active">
								<cfelse>
									<li>
								</cfif>		
									<a href="project_stats.cfm">
										<i class="icon-double-angle-right"></i>
										Project Stats
									</a>
								</li>
								
								
							</ul>
						</li>

						<!--- 
						<li>
							<a href="widgets.html">
								<i class="icon-list-alt"></i>
								<span class="menu-text"> Widgets </span>
							</a>
						</li>

						
						<li>
							<a href="calendar.html">
								<i class="icon-calendar"></i>

								<span class="menu-text">
									Calendar
									<span class="badge badge-transparent tooltip-error" title="2&nbsp;Important&nbsp;Events">
										<i class="icon-warning-sign red bigger-130"></i>
									</span>
								</span>
							</a>
						</li>
						

						<li>
							<a href="gallery.html">
								<i class="icon-picture"></i>
								<span class="menu-text"> Gallery </span>
							</a>
						</li>
						--->	

						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-tag"></i>
								<span class="menu-text"> Transition Phase </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="profile.html">
										<i class="icon-double-angle-right"></i>
										User Profile
									</a>
								</li>

								<li>
									<a href="inbox.html">
										<i class="icon-double-angle-right"></i>
										Inbox
									</a>
								</li>

								<li>
									<a href="pricing.html">
										<i class="icon-double-angle-right"></i>
										Pricing Tables
									</a>
								</li>

								<li>
									<a href="invoice.html">
										<i class="icon-double-angle-right"></i>
										Invoice
									</a>
								</li>

								<li>
									<a href="timeline.html">
										<i class="icon-double-angle-right"></i>
										Timeline
									</a>
								</li>

								<li>
									<a href="login.html">
										<i class="icon-double-angle-right"></i>
										Login &amp; Register
									</a>
								</li>
							</ul>
						</li>

						
						<!--- 
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-file-alt"></i>

								<span class="menu-text">
									Other Pages
									<span class="badge badge-primary ">5</span>
								</span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="faq.html">
										<i class="icon-double-angle-right"></i>
										FAQ
									</a>
								</li>

								<li>
									<a href="error-404.html">
										<i class="icon-double-angle-right"></i>
										Error 404
									</a>
								</li>

								<li>
									<a href="error-500.html">
										<i class="icon-double-angle-right"></i>
										Error 500
									</a>
								</li>

								<li>
									<a href="grid.html">
										<i class="icon-double-angle-right"></i>
										Grid
									</a>
								</li>

								<li>
									<a href="blank.html">
										<i class="icon-double-angle-right"></i>
										Blank Page
									</a>
								</li>
							</ul>
						</li>
						--->
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
				
<!--- BREADCRUMB                                                                   --->
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							
							<li>
								<i class="icon-home home-icon"></i>
								<!--- <a href="#">Must Refactor</a> --->
							</li>

							
							<li>
								<a href="#"><cfoutput>#session.menuTracker.menuTitle#</cfoutput>
								</a>
							</li>
							
							
							<li class="active"><cfoutput>#session.menuTracker.subMenuTitle#</cfoutput></li>
						</ul><!-- .breadcrumb -->
							
					</div>

<!--- BREADCRUMB END                                                                --->

					
<!--- PAGE HEADER  --->                                                                 

					<div class="page-content">
						<!---
						<div class="page-header">
							<h1>
								<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
							</h1>
						</div><!-- /.page-header --> --->	
					