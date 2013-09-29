<!---get all roles --->
<cfinvoke component="roles" method="list" returnvariable="roles">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "projectsetup">
<cfset session.menuTracker.subMenuTitle = "roles">

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
								<a href="#">Project Setup</a>
							</li>
							
							
							<li class="active">Roles</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								Roles
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



<table align="center">
	<cfoutput query="roles">
		<tr>
			<td>#role_name#</td>
			<td><a href="role_edit.cfm?role_id=#role_id#">Edit</a></td>
			<td><a href="role_delete.cfm?role_id=#role_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="role_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">