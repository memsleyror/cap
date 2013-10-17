<cfcomponent>
	<!---list of all user projects --->
		<cffunction name="list" returntype="query" hint="list all user projects" > 
			<cfquery name="userprojects">
				SELECT userproject_id, userproject.user_id, userproject.project_id, projects.project_name, users.user_lastname
				FROM (userproject INNER JOIN users ON userproject.user_id = users.user_id) INNER JOIN projects ON userproject.project_id = projects.project_id
				ORDER BY userproject_id
			</cfquery>
			<cfreturn userprojects>	 
		</cffunction>
		
		<!---get a specific userproject --->
		<cffunction name="get" returntype="query" hint="get user project details">
			<cfargument name="userproject_id" type="numeric" required="yes" hint="userproject ID" >
			<cfquery name="userproject">
				SELECT userproject_id, user_id, project_id
				FROM userproject
				WHERE userproject_id=#ARGUMENTS.userproject_id#
			</cfquery>	 
			<cfreturn userproject>
		</cffunction>

		<!---add a userproject --->
		<cffunction name="add" returntype="boolean" hint="add a userproject">
			
			<!---method arguments --->
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			
			<!---insert user project --->
			<cfquery>
				INSERT INTO userproject(user_id, project_id)
				VALUES(#ARGUMENTS.user_id#,
						#ARGUMENTS.project_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a userproject --->
		<cffunction name="update" returntype="boolean" hint="update a userproject">
			<!---method arguments --->
			<cfargument name="userproject_id" type="numeric" required="yes" hint="userproject ID">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			
			<!---update team --->
			<cfquery>
				UPDATE userproject
				SET user_id=#ARGUMENTS.user_id#,
					project_id=#ARGUMENTS.project_id#
				WHERE userproject_id=#ARGUMENTS.userproject_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a team --->
		<cffunction name="delete" returntype="boolean" hint="delete a userproject">
			<cfargument name="userproject_id" type="numeric" required="yes" hint="userproject ID" >
			<cfquery>
				DELETE FROM userproject
				WHERE userproject_id=#ARGUMENTS.userproject_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	


		<!---get companies --->
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


</cfcomponent>