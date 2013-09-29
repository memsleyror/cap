

<!---get all casesforchange --->
<cfinvoke component="caseforchange" method="list" returnvariable="casesforchange">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "preparephase">
<cfset session.menuTracker.subMenuTitle = "caseforchange">

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
							
							
							<li class="active">Case for Change</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								Case for Change
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



<table align="center">
	<cfoutput query="casesforchange">
		<tr>
			<td>#caseforchange_id#</td>
			<td>#project_name#</td>
			<td><a href="caseforchange_edit.cfm?caseforchange_id=#caseforchange_id#">Edit</a></td>
			<td><a href="caseforchange_delete.cfm?caseforchange_id=#caseforchange_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="caseforchange_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">
