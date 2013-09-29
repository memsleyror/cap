

<!---get all casesforchange --->
<cfinvoke component="stakeholderanalysis" method="list" returnvariable="stakeholderanalyses">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "preparephase">
<cfset session.menuTracker.subMenuTitle = "stakeholderanalysis">

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
								<a href="#">Prepare Phase</a>
							</li>
							
							
							<li class="active">Stakeholder Analysis</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								Stakeholder Analysis
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



<table align="center">
	<cfoutput query="stakeholderanalyses">
		<tr>
			<td>#stakeholderanalysis_id#</td>
			<td>#stakeholdergroup_name#</td>
			<td>#DateFormat(stakeholderanalysis_date, "MM/DD/YYYY")#</td>
			<td><a href="stakeholderanalysis_edit.cfm?stakeholderanalysis_id=#stakeholderanalysis_id#">Edit</a></td>
			<td><a href="stakeholderanalysis_delete.cfm?stakeholderanalysis_id=#stakeholderanalysis_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="stakeholderanalysis_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">
