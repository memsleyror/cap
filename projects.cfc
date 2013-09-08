<cfcomponent>

		<!---list of all projects --->
		<cffunction name="list" returntype="query" hint="list all projects" > 
			<cfquery name="projects">
				SELECT project_id, project_name
				FROM projects
				ORDER BY project_name
			</cfquery>
			<cfreturn projects>	 
		</cffunction>
		
		<!---get a specific project --->
		<cffunction name="get" returntype="query" hint="get project details">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID" >
			<cfquery name="project">
				SELECT project_id, project_name, project_desc, project_start_date, project_end_date, company_id
				FROM projects
				WHERE project_id=#ARGUMENTS.project_id#
			</cfquery>	 
			<cfreturn project>
		</cffunction>

		<!---add a project --->
		<cffunction name="add" returntype="boolean" hint="add a project">
			
			<!---method arguments --->
			<cfargument name="project_name" type="string" required="yes" hint="project name">
			<cfargument name="project_desc" type="string" required="yes" hint="project description">
			<cfargument name="project_start_date" type="date" required="yes" hint="project start date">
			<cfargument name="project_end_date" type="date" required="yes" hint="project end date">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID">
			
			<!---insert project --->
			<cfquery>
				INSERT INTO projects(project_name, project_desc, project_start_date, project_end_date, company_id)
				VALUES('#Trim(ARGUMENTS.project_name)#',
						'#Trim(ARGUMENTS.project_desc)#',
						#CreateODBCDate(ARGUMENTS.project_start_date)#,
						#CreateODBCDate(ARGUMENTS.project_end_date)#,
						#ARGUMENTS.company_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a project --->
		<cffunction name="update" returntype="boolean" hint="update a project">
			<!---method arguments --->
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			<cfargument name="project_name" type="string" required="yes" hint="project name">
			<cfargument name="project_desc" type="string" required="yes" hint="project description">
			<cfargument name="project_start_date" type="date" required="yes" hint="project start date">
			<cfargument name="project_end_date" type="date" required="yes" hint="project end date">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID">
			
			<!---update project --->
			<cfquery>
				UPDATE projects
				SET project_name='#Trim(ARGUMENTS.project_name)#',
					project_desc='#Trim(ARGUMENTS.project_desc)#',
					project_start_date=#CreateODBCDate(ARGUMENTS.project_start_date)#,
					project_end_date=#CreateODBCDate(ARGUMENTS.project_end_date)#,
					company_id=#ARGUMENTS.company_id#
				WHERE project_id=#ARGUMENTS.project_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a project --->
		<cffunction name="delete" returntype="boolean" hint="delete a project">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID" >
			<cfquery>
				DELETE FROM projects
				WHERE project_id=#ARGUMENTS.project_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	


		<!---get companies --->
		<cffunction name="getCompanies" returntype="query" hint="get companies">
			<cfquery name="companies">
				SELECT company_id, company_name
				FROM company
				ORDER BY company_id
			</cfquery>	
			<cfreturn companies>	
		</cffunction>





</cfcomponent>