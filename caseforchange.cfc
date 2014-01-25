<cfcomponent>

	<!---list of all cases for change --->
		<cffunction name="list" returntype="query" hint="list all cases for change" > 
			<cfquery name="casesforchange">
				SELECT caseforchange_id, caseforchange_text, caseforchange_date, caseforchange.project_id, projects.project_name
				FROM caseforchange INNER JOIN projects ON caseforchange.project_id = projects.project_id
				ORDER BY caseforchange_date
			</cfquery>
			<cfreturn casesforchange>	 
		</cffunction>
		
		<!---get a specific caseforchange --->
		<cffunction name="get" returntype="query" hint="get case for change details">
			<cfargument name="caseforchange_id" type="numeric" required="yes" hint="caseforchange ID" >
			<cfquery name="caseforchange">
				SELECT caseforchange_id, caseforchange_text, caseforchange_date, project_id, user_id, version_id
				FROM caseforchange
				WHERE caseforchange_id=#ARGUMENTS.caseforchange_id#
			</cfquery>	 
			<cfreturn caseforchange>
		</cffunction>
		
		<!---get a specific PROJECT caseforchange --->
		<cffunction name="getprojectcase" returntype="query" hint="get case for change details">
			
			<cfquery name="projectcaseforchange">
				SELECT caseforchange_id, caseforchange_text, caseforchange_date, project_id, user_id, version_id
				FROM caseforchange
				WHERE caseforchange.project_id=#ARGUMENTS.project_id#
			</cfquery>	 
			<cfreturn projectcaseforchange>
		</cffunction>

		<!---add a caseforchange --->
		<cffunction name="add" returntype="boolean" hint="add a caseforchange">
			
			<!---method arguments --->
			<cfargument name="caseforchange_text" type="string" required="yes" hint="caseforchange text">
			<cfargument name="caseforchange_date" type="date" required="yes" hint="caseforchange_date">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="version_id" type="numeric" required="yes" hint="version ID">
			
			
			<!---insert caseforchange --->
			<cfquery>
				INSERT INTO caseforchange(caseforchange_text, caseforchange_date, project_id, user_id, version_id)
				VALUES('#Trim(ARGUMENTS.caseforchange_text)#',
						#CreateODBCDate(ARGUMENTS.caseforchange_date)#,
						#ARGUMENTS.project_id#,
						#ARGUMENTS.user_id#,
						#ARGUMENTS.version_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a caseforchange --->
		<cffunction name="update" returntype="boolean" hint="update a caseforchange">
			<!---method arguments --->
			<cfargument name="caseforchange_id" type="numeric" required="yes" hint="caseforchange ID">
			<cfargument name="caseforchange_text" type="string" required="yes" hint="caseforchange name">
			<cfargument name="caseforchange_date" type="date" required="yes" hint="caseforchange_date">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="version_id" type="numeric" required="yes" hint="version ID">
			
			<!---update caseforchange --->
			<cfquery>
				UPDATE caseforchange
				SET caseforchange_text='#Trim(ARGUMENTS.caseforchange_text)#',
					caseforchange_date=#CreateODBCDate(ARGUMENTS.caseforchange_date)#,
					project_id=#ARGUMENTS.project_id#,
					user_id=#ARGUMENTS.user_id#,
					version_id=#ARGUMENTS.version_id#
				WHERE caseforchange_id=#ARGUMENTS.caseforchange_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a caseforchange --->
		<cffunction name="delete" returntype="boolean" hint="delete a caseforchange">
			<cfargument name="caseforchange_id" type="numeric" required="yes" hint="caseforchange ID" >
			<cfquery>
				DELETE FROM caseforchange
				WHERE caseforchange_id=#ARGUMENTS.caseforchange_id#
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
		
		<!---get versions --->
		<cffunction name="getVersions" returntype="query" hint="get versions">
			<cfquery name="versions">
				SELECT version_id, version_name
				FROM versions
				ORDER BY version_id
			</cfquery>	
			<cfreturn versions>	
		</cffunction>

</cfcomponent>