<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Home">
<cfset session.menuTracker.subMenuTitle = "Dashboard">

<cfinclude template="header.cfm">

<div class="page-header">
							<h1>
								<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
								<!--- 
								<small>
									<i class="icon-double-angle-right"></i>
									<cfoutput>#FormTitle#</cfoutput>
								</small>
								--->
							</h1>
</div><!-- /.page-header -->




<!---page footer --->
<cfinclude template="footer.cfm">
