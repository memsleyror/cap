
<!---first time in i am brining url.project_id --->
<!---next time i am not --->
<!--- set session = project id --->

<cfif IsDefined("URL.project_id")>
	<cfset session.proj.project_id = URL.project_id>
</cfif>	

<!---get the project record --->
	<cfinvoke component="projects" method="get" project_id="#session.proj.project_id#" returnvariable="project">

	<!---save info to variables --->
	<cfset project_name=Trim(project.project_name)>

<!---get the mood record --->
	<cfinvoke component="projects" method="getmood" project_id="#session.proj.project_id#" returnvariable="mymood">
	
	<!---save info to variables --->
	<cfset mood_name=Trim(mymood.mood_name)>
	<cfset mood_id=mymood.mood_id>
	
<!---get moods --->
<cfinvoke component="projects" method="getMoods" returnvariable="moods"> 	

<!---button caption --->
<cfset ButtonText="Update">	

<!--- INCLUDE HEADER                                                               --->
<cfset session.menuTracker.menuTitle = "Home">
<cfset session.menuTracker.subMenuTitle = "Dashboard">

<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		<cfoutput>#session.menuTracker.subMenuTitle#</cfoutput>
		
		<small>
			<i class="icon-double-angle-right"></i>
			<cfoutput>#project_name#</cfoutput>
			<!---<cfoutput> #FormTitle#</cfoutput>--->
		</small>
		
	</h1>
</div><!-- /.page-header -->

<!---assuming this sets up the entire page --->
<div class="row">
	<div class="col-xs-12">

<!--- PAGE CONTENT BEGINS --->

<div class="row">
	
	<!---first box --->
	<div class="col-sm-6">
		<div class="widget-box ">
			<div class="widget-header">
				<h4 class="lighter smaller">
					<i class="icon-comment blue"></i>
					Box 1
				</h4>
			</div>
				
				<div class="widget-body">
				
						<div class="widget-main no-padding">			
						Content will go here
						<cfoutput>#session.proj.project_id#</cfoutput>
	
						</div><!--- /widget-main --->
				</div><!--- /widget-body --->
		</div><!--- /widget-box --->
	</div><!---span --->

	<div class="col-sm-6">
		<div class="widget-box transparent">
			<div class="widget-header widget-header-flat">
				<h4 class="lighter">
					<i class="icon-signal"></i>
					How I Feel About This Project
				</h4>

				<div class="widget-toolbar">
					<a href="#" data-action="collapse">
						<i class="icon-chevron-up"></i>
					</a>
				</div>
			</div>

			<div class="widget-body">
				<div class="widget-main padding-4">
					Currently, I feel:<br>
					<cfoutput>#mood_name#</cfoutput><br><br>
					
					<cfform action="projectmood_update.cfm" class="form-horizontal" role="form">
					
					<cfoutput>
						<input type="hidden" name="userprojectmood_id" value="#mymood.userprojectmood_id#">
					</cfoutput>
					
					<cfselect name="mood_id" class="form-control" query="moods" value="mood_id" display="mood_name" <!--- selected="#VARIABLES.mood_id#"---> ></cfselect>
					
					<cfoutput>
						<button class="btn btn-info" name="button_pos" input type="submit" value="#ButtonText#">
							<i class="icon-ok bigger-110"></i>
							#ButtonText#
						</button>
					</cfoutput>
					
					</cfform>
					
				</div><!--- /widget-main --->
			</div><!--- /widget-body --->
		</div><!--- /widget-box --->
	</div><!---span --->

</div><!---end of row 1 --->

<!---these 2 divs close the entire page --->
	</div>
</div>

<!---page footer --->
<cfinclude template="footer.cfm">
