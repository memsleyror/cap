<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Global Settings">
<cfset session.menuTracker.subMenuTitle = "Global Settings Menu">

<cfinclude template="header.cfm">





<!--- CONTENT                                                                       --->

						<div class="row">
							<div class="col-xs-12">
								
			<a href="companies.cfm">Companies</a><br>
			<a href="users.cfm">Users</a> <br>
			<a href="versions.cfm">Versions</a><br>
			<a href="moods.cfm">Moods</a><br>
			<a href="usercompany.cfm">User-Company</a><br>

<!--- INCLUDE FOOTER                                                                --->
<cfinclude template="footer.cfm">