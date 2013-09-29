<!---get all users --->
<cfinvoke component="users" method="list" returnvariable="users">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "globalsettings">
<cfset session.menuTracker.subMenuTitle = "users">

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

							
							<li>
								<a href="#">Global Settings</a>
							</li>
							
							
							<li class="active">Users</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								Users
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



<table align="center">
	<cfoutput query="users">
		<tr>
			<td>#user_lastname#</td>
			<td><a href="user_edit.cfm?user_id=#user_id#">Edit</a></td>
			<td><a href="user_delete.cfm?user_id=#user_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="user_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">