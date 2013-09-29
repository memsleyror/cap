<!---get all versions --->
<cfinvoke component="versions" method="list" returnvariable="versions">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "globalsettings">
<cfset session.menuTracker.subMenuTitle = "versions">

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
							
							
							<li class="active">Versions</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								Versions
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">

<table align="center">
	<cfoutput query="versions">
		<tr>
			<td>#version_name#</td>
			<td><a href="version_edit.cfm?version_id=#version_id#">Edit</a></td>
			<td><a href="version_delete.cfm?version_id=#version_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="version_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">