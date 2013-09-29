<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "">
<cfset session.menuTracker.subMenuTitle = "">

<cfinclude template="header.cfm">



<!--- BREADCRUMB                                                                   --->
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">Kronos TAP Project</a>
							</li>

							<!--- 
							<li>
								<a href="#"></a>
							</li>
							--->
							
							<li class="active">Global Settings</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								Global Settings
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">
								
			<a href="companies.cfm">Companies</a><br>
			<a href="users.cfm">Users</a> <br>
			<a href="versions.cfm">Versions</a><br>
			<a href="usercompany.cfm">User-Company</a><br>

<!--- INCLUDE FOOTER                                                                --->
<cfinclude template="footer.cfm">