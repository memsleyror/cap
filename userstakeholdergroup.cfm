

<!---get all userstakeholdergroups --->
<cfinvoke component="userstakeholdergroup" method="list" returnvariable="userstakeholdergroups">

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "projectsetup">
<cfset session.menuTracker.subMenuTitle = "userstakeholdergroup">

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
							
							
							<li class="active">User Stakeholder Group</li>
						</ul><!-- .breadcrumb -->
							
					</div>
					
<!--- PAGE HEADER                                                                   --->

					<div class="page-content">
						<div class="page-header">
							<h1>
								User Stakeholder Group
							</h1>
						</div><!-- /.page-header -->

<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">


<table align="center">
	<cfoutput query="userstakeholdergroups">
		<tr>
			<td>#user_lastname#</td>
			<td>#stakeholdergroup_name#</td>
			<td><a href="userstakeholdergroup_edit.cfm?userstakeholdergroup_id=#userstakeholdergroup_id#">Edit</a></td>
			<td><a href="userstakeholdergroup_delete.cfm?userstakeholdergroup_id=#userstakeholdergroup_id#">Delete</a></td>
		</tr>
	</cfoutput>	
		
		<tr>
			<td></td>
			<td colspan="2" align="center"><a href="userstakeholdergroup_edit.cfm">Add</a></td>
		</tr>
	
	
</table>	

<!---page header --->
<cfinclude template="footer.cfm">
