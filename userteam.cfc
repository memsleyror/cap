<cfcomponent>
	<!---list of all user teams --->
		<cffunction name="list" returntype="query" hint="list all user teams" > 
			<cfquery name="userteams">
				SELECT userteam_id, userteam.user_id, userteam.team_id, teams.team_name, users.user_lastname
				FROM (userteam INNER JOIN users ON userteam.user_id = users.user_id) INNER JOIN teams ON userteam.team_id = teams.team_id
				ORDER BY userteam_id
			</cfquery>
			<cfreturn userteams>	 
		</cffunction>
		
		<!---get a specific userteam --->
		<cffunction name="get" returntype="query" hint="get user team details">
			<cfargument name="userteam_id" type="numeric" required="yes" hint="userteam ID" >
			<cfquery name="userteam">
				SELECT userteam_id, user_id, team_id
				FROM userteam
				WHERE userteam_id=#ARGUMENTS.userteam_id#
			</cfquery>	 
			<cfreturn userteam>
		</cffunction>

		<!---add a userteam --->
		<cffunction name="add" returntype="boolean" hint="add a userteam">
			
			<!---method arguments --->
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="team_id" type="numeric" required="yes" hint="team ID">
			
			<!---insert team --->
			<cfquery>
				INSERT INTO userteam(user_id, team_id)
				VALUES(#ARGUMENTS.user_id#,
						#ARGUMENTS.team_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a userteam --->
		<cffunction name="update" returntype="boolean" hint="update a userteam">
			<!---method arguments --->
			<cfargument name="userteam_id" type="numeric" required="yes" hint="userteam ID">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="team_id" type="numeric" required="yes" hint="team ID">
			
			<!---update team --->
			<cfquery>
				UPDATE userteam
				SET user_id=#ARGUMENTS.user_id#,
					team_id=#ARGUMENTS.team_id#
				WHERE userteam_id=#ARGUMENTS.userteam_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a userteam --->
		<cffunction name="delete" returntype="boolean" hint="delete a userteam">
			<cfargument name="userteam_id" type="numeric" required="yes" hint="userteam ID" >
			<cfquery>
				DELETE FROM userteam
				WHERE userteam_id=#ARGUMENTS.userteam_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	


		<!---get teams --->
		<cffunction name="getteams" returntype="query" hint="get teams">
			<cfquery name="teams">
				SELECT team_id, team_name
				FROM teams
				ORDER BY team_id
			</cfquery>	
			<cfreturn teams>	
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