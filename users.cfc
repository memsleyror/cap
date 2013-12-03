<cfcomponent>
	
	<!---list of all users --->
		<cffunction name="list" returntype="query" hint="list all users" > 
			<cfquery name="users">
				SELECT user_id, user_lastname
				FROM users
				ORDER BY user_lastname
			</cfquery>
			<cfreturn users>	 
		</cffunction>
		
		<!---get a specific user --->
		<cffunction name="get" returntype="query" hint="get user details">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID" >
			<cfquery name="user">
				SELECT user_id, user_login, user_password, user_firstname, user_lastname, user_email, role_id, user_default_project_id, image_file
				FROM users
				WHERE user_id=#ARGUMENTS.user_id#
			</cfquery>	 
			<cfreturn user>
		</cffunction>

		<!---add a user --->
		<cffunction name="add" returntype="boolean" hint="add a user">
			
			<!---method arguments --->
			<cfargument name="user_login" type="string" required="yes" hint="user login">
			<cfargument name="user_password" type="string" required="yes" hint="user password">
			<cfargument name="user_firstname" type="string" required="yes" hint="user first name">
			<cfargument name="user_lastname" type="string" required="yes" hint="user last name">
			<cfargument name="user_email" type="string" required="yes" hint="user email">	
			<cfargument name="role_id" type="numeric" required="yes" hint="user role ID">
			<cfargument name="user_default_project_id" type="numeric" required="yes" hint="user def proj ID">
			
			
			<!---insert user --->
			<cfquery>
				INSERT INTO users(user_login, user_password, user_firstname, user_lastname, user_email, role_id, user_default_project_id)
				VALUES('#Trim(ARGUMENTS.user_login)#',
						'#Trim(ARGUMENTS.user_password)#',
						'#Trim(ARGUMENTS.user_firstname)#',
						'#Trim(ARGUMENTS.user_lastname)#',
						'#Trim(ARGUMENTS.user_email)#',
						#ARGUMENTS.role_id#,
						#ARGUMENTS.user_default_project_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a user --->
		<cffunction name="update" returntype="boolean" hint="update a user">
			<!---method arguments --->
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="user_login" type="string" required="yes" hint="user login">
			<cfargument name="user_password" type="string" required="yes" hint="user password">
			<cfargument name="user_firstname" type="string" required="yes" hint="user first name">
			<cfargument name="user_lastname" type="string" required="yes" hint="user last name">
			<cfargument name="user_email" type="string" required="yes" hint="user email">	
			<cfargument name="role_id" type="numeric" required="yes" hint="user role ID">
			<cfargument name="image_file" type="string" required="yes" hint="user role ID">
			
			<!---update user --->
			<cfquery>
				UPDATE users
				SET user_login='#Trim(ARGUMENTS.user_login)#',
					user_password='#Trim(ARGUMENTS.user_password)#',
					user_firstname='#Trim(ARGUMENTS.user_firstname)#',
					user_lastname='#Trim(ARGUMENTS.user_lastname)#',
					user_email='#Trim(ARGUMENTS.user_email)#',
					role_id=#ARGUMENTS.role_id#,
					image_file = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.image_file#">
				WHERE user_id=#ARGUMENTS.user_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a user --->
		<cffunction name="delete" returntype="boolean" hint="delete a user">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID" >
			<cfquery>
				DELETE FROM users
				WHERE user_id=#ARGUMENTS.user_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	

		<!---get roles --->
		<cffunction name="getRoles" returntype="query" hint="get roles">
			<cfquery name="roles">
				SELECT role_id, role_name
				FROM roles
				ORDER BY role_id
			</cfquery>	
			<cfreturn roles>	
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

		<!---get user projects 
		<cffunction name="getUserProjects" returntype="query" hint="get user projects">
			<cfquery name="userProjects">
				SELECT userproject_id, userproject.user_id, userproject.project_id, projects.project_name
				FROM (userproject INNER JOIN users ON userproject.user_id = users.user_id) INNER JOIN projects ON userproject.project_id = projects.project_id
				WHERE userproject_id=#session.auth.user_id#
			</cfquery>	
			<cfreturn userProjects>	
		</cffunction>
		--->


</cfcomponent>