

<!---get all milestones --->
<cfinvoke component="milestones" method="list" returnvariable="milestones">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "projectsetup">
<cfset session.menuTracker.subMenuTitle = "milestones">

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
							
							
							<li class="active">Milestones</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								Milestones
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">


<table align="center">
	<cfoutput query="milestones">
		<tr>
			<td>#milestone_name#</td>
			<td><a href="milestone_edit.cfm?milestone_id=#milestone_id#">Edit</a></td>
			<td><a href="milestone_delete.cfm?milestone_id=#milestone_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="milestone_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">
