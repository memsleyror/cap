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
		
		<!--- get user specific projects based on session user id --->
			
		<cffunction name="getmine" returntype="query" hint="get my projects">
			<cfquery name="myprojects">	
				SELECT projects.project_id, projects.project_name, users.user_lastname, users.user_id, userproject.userproject_id
				FROM projects INNER JOIN userproject ON projects.project_id = userproject.project_id
		 		INNER JOIN users ON userproject.user_id = users.user_id
		 		WHERE users.user_id = #session.auth.user_id#
			</cfquery>	 
			<cfreturn myprojects>
		</cffunction>	

		<!---get my mood --->

		<cffunction name="getmood" returntype="query" hint="get my mood">
			<cfquery name="mymood">	
				SELECT projects.project_id, 
					userproject.user_id, 
					userprojectmood.userproject_id, 
					mood.mood_id, 
					mood.mood_name, 
					userprojectmood.userprojectmood_id
				FROM userproject 
				INNER JOIN userprojectmood ON userproject.userproject_id = userprojectmood.userproject_id
	 			INNER JOIN projects ON projects.project_id = userproject.project_id
	 			INNER JOIN mood ON userprojectmood.mood_id = mood.mood_id
	 			WHERE userproject.user_id = #session.auth.user_id#
	 			AND projects.project_id=#ARGUMENTS.project_id#
	 		</cfquery>	 
			<cfreturn mymood>	
		</cffunction>	
		
		<!--- get avg mood score for a project --->
			
		<cffunction name="getavgmood" returntype="query" hint="get avg mood">
			<cfquery name="avgmood">	
				SELECT 
			        `projects`.`project_id` AS `project_id`,
			        avg(`mood`.`mood_score`) AS `AVG(mood.mood_score)`
			    FROM
			        (((`userproject`
			        INNER JOIN `projects` ON ((`userproject`.`project_id` = `projects`.`project_id`)))
			        INNER JOIN `userprojectmood` ON ((`userproject`.`userproject_id` = `userprojectmood`.`userproject_id`)))
			        INNER JOIN `mood` ON ((`userprojectmood`.`mood_id` = `mood`.`mood_id`)))
		        WHERE project_id=#ARGUMENTS.project_id#
		        
			</cfquery>	 
			<cfreturn avgmood>
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
		
		<!---add a project mood --->
		<cffunction name="addMood" returntype="boolean" hint="add a project mood">
			
			<!---method arguments --->
			<cfargument name="mood_id" type="numeric" required="yes" hint="mood ID">
			
			<!---insert project mood--->
			<!--- 
			<cfquery>
				INSERT INTO projects(project_name, project_desc, project_start_date, project_end_date, company_id)
				VALUES('#Trim(ARGUMENTS.project_name)#',
						'#Trim(ARGUMENTS.project_desc)#',
						#CreateODBCDate(ARGUMENTS.project_start_date)#,
						#CreateODBCDate(ARGUMENTS.project_end_date)#,
						#ARGUMENTS.mood_id#
				)
			</cfquery>	
			<cfreturn true>
			--->
		</cffunction>	
		
		<!---update a project mood --->
		<cffunction name="updateMood" returntype="boolean" hint="update a project mood">
			<!---method arguments --->
			<cfargument name="userprojectmood_id" type="numeric" required="yes" hint="userprojectmood ID">
			<cfargument name="mood_id" type="numeric" required="yes" hint="mood ID">
			
			<!---update project --->
			<cfquery>
				UPDATE userprojectmood
				SET mood_id=#ARGUMENTS.mood_id#
				WHERE userprojectmood_id=#ARGUMENTS.userprojectmood_id#
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
		
		<!---get moods --->
		<cffunction name="getMoods" returntype="query" hint="get moods">
			<cfquery name="moods">
				SELECT mood_id, mood_name
				FROM mood
				ORDER BY mood_id
			</cfquery>	
			<cfreturn moods>	
		</cffunction>





</cfcomponent>