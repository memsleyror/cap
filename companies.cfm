<!---get all companies --->
<cfinvoke component="companies" method="list" returnvariable="companies">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "globalsettings">
<cfset session.menuTracker.subMenuTitle = "companies">

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
							
							
							<li class="active">Companies</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								Companies
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">


<table align="center">
	<cfoutput query="companies">
		<tr>
			<td>#company_name#</td>
			<td><a href="company_edit.cfm?company_id=#company_id#">Edit</a></td>
			<td><a href="company_delete.cfm?company_id=#company_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="company_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">