

<!---get all userteams --->
<cfinvoke component="userteam" method="list" returnvariable="userteams">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "projectsetup">
<cfset session.menuTracker.subMenuTitle = "userteam">

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
							
							
							<li class="active">User Team</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								User Team
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">


<table align="center">
	<cfoutput query="userteams">
		<tr>
			<td>#user_lastname#</td>
			<td>#team_name#</td>
			<td><a href="userteam_edit.cfm?userteam_id=#userteam_id#">Edit</a></td>
			<td><a href="userteam_delete.cfm?userteam_id=#userteam_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="userteam_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
