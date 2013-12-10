<cfcomponent>

	<!---list of all projectfeeds for all projects--->
		<cffunction name="list" returntype="query" hint="list all project feeds" > 
			<cfquery name="projectfeeds">
				SELECT projectfeed_id, projectfeed_title, projectfeed_text, projectfeed_date, projectfeed.project_id, projects.project_name
				FROM projectfeed INNER JOIN projects ON projectfeed.project_id = projects.project_id
				ORDER BY projectfeed_date
			</cfquery>
			<cfreturn projectfeeds>	 
		</cffunction>
		
		<!---list of all projectfeeds for a specific project--->
		<cffunction name="getProjFeeds" returntype="query" hint="list all project feeds" > 
			<cfquery name="projprojectfeeds">
				SELECT projectfeed_id, projectfeed_title, projectfeed_text, 
				projectfeed_date, projectfeed.project_id, projects.project_name,
				feedtypes.feedtype_icon, feedtypes.feedtype_button
				FROM projectfeed INNER JOIN projects ON projectfeed.project_id = projects.project_id
				left join feedtypes on projectfeed.feedtype_id = feedtypes.feedtype_id
				WHERE projectfeed.project_id=<cfqueryparam cfsqltype="cf_sql_interger" value="#ARGUMENTS.project_id#">
				ORDER BY projectfeed_date
			</cfquery>
			<cfreturn projprojectfeeds>	 
		</cffunction>
		
		<!---get a specific projectfeed --->
		<cffunction name="get" returntype="query" hint="get case for change details">
			<cfargument name="projectfeed_id" type="numeric" required="yes" hint="projectfeed ID" >
			<cfquery name="projectfeed">
				SELECT projectfeed_id, projectfeed_title, projectfeed_text, projectfeed_date, project_id, user_id, feedtype_id
				FROM projectfeed
				WHERE projectfeed_id=#ARGUMENTS.projectfeed_id#
			</cfquery>	 
			<cfreturn projectfeed>
		</cffunction>

		<!---add a projectfeed --->
		<cffunction name="add" returntype="boolean" hint="add a projectfeed">
			
			<!---method arguments --->
			<cfargument name="projectfeed_title" type="string" required="yes" hint="projectfeed title">
			<cfargument name="projectfeed_text" type="string" required="yes" hint="projectfeed text">
			<cfargument name="projectfeed_date" type="date" required="yes" hint="projectfeed_date">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="feedtype_id" type="numeric" required="yes" hint="feedtype ID">
			
			
			<!---insert projectfeed --->
			<cfquery>
				INSERT INTO projectfeed(projectfeed_title, projectfeed_text, projectfeed_date, project_id, user_id, feedtype_id)
				VALUES('#Trim(ARGUMENTS.projectfeed_title)#',
						'#Trim(ARGUMENTS.projectfeed_text)#',
						#CreateODBCDate(ARGUMENTS.projectfeed_date)#,
						#ARGUMENTS.project_id#,
						#ARGUMENTS.user_id#,
						#ARGUMENTS.feedtype_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a projectfeed --->
		<cffunction name="update" returntype="boolean" hint="update a projectfeed">
			<!---method arguments --->
			<cfargument name="projectfeed_id" type="numeric" required="yes" hint="projectfeed ID">
			<cfargument name="projectfeed_title" type="string" required="yes" hint="projectfeed title">
			<cfargument name="projectfeed_text" type="string" required="yes" hint="projectfeed text">
			<cfargument name="projectfeed_date" type="date" required="yes" hint="projectfeed_date">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="feedtype_id" type="numeric" required="yes" hint="feedtype ID">
			
			<!---update projectfeed --->
			<cfquery>
				UPDATE projectfeed
				SET projectfeed_title='#Trim(ARGUMENTS.projectfeed_title)#',
					projectfeed_text='#Trim(ARGUMENTS.projectfeed_text)#',
					projectfeed_date=#CreateODBCDate(ARGUMENTS.projectfeed_date)#,
					project_id=#ARGUMENTS.project_id#,
					user_id=#ARGUMENTS.user_id#,
					feedtype_id=#ARGUMENTS.feedtype_id#
				WHERE projectfeed_id=#ARGUMENTS.projectfeed_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a projectfeed --->
		<cffunction name="delete" returntype="boolean" hint="delete a projectfeed">
			<cfargument name="projectfeed_id" type="numeric" required="yes" hint="projectfeed ID" >
			<cfquery>
				DELETE FROM projectfeed
				WHERE projectfeed_id=#ARGUMENTS.projectfeed_id#
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
		
		<!---get users --->
		<cffunction name="getUsers" returntype="query" hint="get users">
			<cfquery name="users">
				SELECT user_id, user_lastname
				FROM users
				ORDER BY user_id
			</cfquery>	
			<cfreturn users>	
		</cffunction>
		
		<!---get feedtypes --->
		<cffunction name="getFeedtypes" returntype="query" hint="get feedtypes">
			<cfquery name="feedtypes">
				SELECT feedtype_id, feedtype_name
				FROM feedtypes
				ORDER BY feedtype_id
			</cfquery>	
			<cfreturn feedtypes>	
		</cffunction>

</cfcomponent>