

<!---get all stakeholdergroups --->
<cfinvoke component="stakeholdergroups" method="list" returnvariable="stakeholdergroups">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "projectsetup">
<cfset session.menuTracker.subMenuTitle = "stakeholdergroups">

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
							
							
							<li class="active">Stakeholder Groups</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								Stakeholder Groups
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">



<table align="center">
	<cfoutput query="stakeholdergroups">
		<tr>
			<td>#stakeholdergroup_name#</td>
			<td><a href="stakeholdergroup_edit.cfm?stakeholdergroup_id=#stakeholdergroup_id#">Edit</a></td>
			<td><a href="stakeholdergroup_delete.cfm?stakeholdergroup_id=#stakeholdergroup_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="stakeholdergroup_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page footer --->
<cfinclude template="footer.cfm">
