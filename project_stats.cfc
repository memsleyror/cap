<cfcomponent>

	<!---list of all project_stats for all projects--->
		<cffunction name="list" returntype="query" hint="list all project feeds" > 
			<cfquery name="all_project_stats">
				SELECT project_stat_id, project_stat_name, project_stat_note, project_stat_value, project_stat_style, project_stats.project_id, projects.project_name
				FROM project_stats INNER JOIN projects ON project_stats.project_id = projects.project_id
				
			</cfquery>
			<cfreturn all_project_stats>	 
		</cffunction>
		
		<!---list of all project_stats for a specific project--->
		<cffunction name="getProjStats" returntype="query" hint="list all project feeds" > 
			<cfquery name="project_stats">
				SELECT project_stat_id, project_stat_name, project_stat_note, project_stat_value, project_stat_style, project_stats.project_id, projects.project_name
				
				FROM project_stats INNER JOIN projects ON project_stats.project_id = projects.project_id
				
				WHERE project_stats.project_id=<cfqueryparam cfsqltype="cf_sql_interger" value="#ARGUMENTS.project_id#">
				
			</cfquery>
			<cfreturn project_stats>	 
		</cffunction>
		
		
		<!---get a specific project_stat --->
		<cffunction name="get" returntype="query" hint="get case for change details">
			<cfargument name="project_stat_id" type="numeric" required="yes" hint="project_stat ID" >
			<cfquery name="specific_project_stat">
				SELECT project_stat_id, project_stat_name, project_stat_note, project_stat_value, project_stat_style, project_id
				FROM project_stats
				WHERE project_stat_id=#ARGUMENTS.project_stat_id#
			</cfquery>	 
			<cfreturn specific_project_stat>
		</cffunction>

		<!---add a project_stat --->
		<cffunction name="add" returntype="boolean" hint="add a project_stat">
			
			<!---method arguments --->
			<cfargument name="project_stat_name" type="string" required="yes" hint="project_stat name">
			<cfargument name="project_stat_note" type="string" required="yes" hint="project_stat note">
			<cfargument name="project_stat_value" type="string" required="yes" hint="project_stat_value">
			<cfargument name="project_stat_style" type="string" required="yes" hint="project_stat_style">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			
			
			<!---insert project_stat --->
			<cfquery>
				INSERT INTO project_stats(project_stat_name, project_stat_note, project_stat_value, project_stat_style, project_id)
				VALUES('#Trim(ARGUMENTS.project_stat_name)#',
						'#Trim(ARGUMENTS.project_stat_note)#',
						'#Trim(ARGUMENTS.project_stat_value)#',
						'#Trim(ARGUMENTS.project_stat_style)#',
						#ARGUMENTS.project_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a project_stat --->
		<cffunction name="update" returntype="boolean" hint="update a project_stat">
			<!---method arguments --->
			<cfargument name="project_stat_id" type="numeric" required="yes" hint="project_stat ID">
			<cfargument name="project_stat_name" type="string" required="yes" hint="project_stat name">
			<cfargument name="project_stat_note" type="string" required="yes" hint="project_stat note">
			<cfargument name="project_stat_value" type="string" required="yes" hint="project_stat_value">
			<cfargument name="project_stat_style" type="string" required="yes" hint="project_stat_style">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			
			<!---update project_stat --->
			<cfquery>
				UPDATE project_stats
				SET project_stat_name='#Trim(ARGUMENTS.project_stat_name)#',
					project_stat_note='#Trim(ARGUMENTS.project_stat_note)#',
					project_stat_value='#Trim(ARGUMENTS.project_stat_value)#',
					project_stat_style='#Trim(ARGUMENTS.project_stat_style)#',
					project_id=#ARGUMENTS.project_id#
					
				WHERE project_stat_id=#ARGUMENTS.project_stat_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a project_stat --->
		<cffunction name="delete" returntype="boolean" hint="delete a project_stat">
			<cfargument name="project_stat_id" type="numeric" required="yes" hint="project_stat ID" >
			<cfquery>
				DELETE FROM project_stats
				WHERE project_stat_id=#ARGUMENTS.project_stat_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	

		<!---get projects --->
		<cffunction name="getProjects" returntype="query" hint="get projects">
			<cfquery name="projects">
				SELECT project_id, project_name
				FROM projects
				ORDER BY project_id
			</cfquery>	
			<cfreturn projects>	
		</cffunction>
		


</cfcomponent>