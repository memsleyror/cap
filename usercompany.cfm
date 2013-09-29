

<!---get all usercompanies --->
<cfinvoke component="usercompany" method="list" returnvariable="usercompanies">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "globalsettings">
<cfset session.menuTracker.subMenuTitle = "User Company">

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
								<a href="#">Global Settings
								</a>
							</li>
							
							
							<li class="active"><cfoutput>#session.menuTracker.subMenuTitle#</cfoutput></li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">


<table align="center">
	<cfoutput query="usercompanies">
		<tr>
			<td>#user_lastname#</td>
			<td>#company_name#</td>
			<td><a href="usercompany_edit.cfm?usercompany_id=#usercompany_id#">Edit</a></td>
			<td><a href="usercompany_delete.cfm?usercompany_id=#usercompany_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="usercompany_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
