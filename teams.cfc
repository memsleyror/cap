<cfcomponent>
	<!---list of all teams --->
		<cffunction name="list" returntype="query" hint="list all teams" > 
			<cfquery name="teams">
				SELECT team_id, team_name
				FROM teams
				ORDER BY team_name
			</cfquery>
			<cfreturn teams>	 
		</cffunction>
		
		<!---get a specific team --->
		<cffunction name="get" returntype="query" hint="get team details">
			<cfargument name="team_id" type="numeric" required="yes" hint="team ID" >
			<cfquery name="team">
				SELECT team_id, team_name, team_desc, team_size, company_id
				FROM teams
				WHERE team_id=#ARGUMENTS.team_id#
			</cfquery>	 
			<cfreturn team>
		</cffunction>

		<!---add a team --->
		<cffunction name="add" returntype="boolean" hint="add a team">
			
			<!---method arguments --->
			<cfargument name="team_name" type="string" required="yes" hint="team name">
			<cfargument name="team_desc" type="string" required="yes" hint="team description">
			<cfargument name="team_size" type="string" required="yes" hint="team size">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID">
			
			<!---insert team --->
			<cfquery>
				INSERT INTO teams(team_name, team_desc, team_size, company_id)
				VALUES('#Trim(ARGUMENTS.team_name)#',
						'#Trim(ARGUMENTS.team_desc)#',
						'#Trim(ARGUMENTS.team_size)#',
						#ARGUMENTS.company_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a team --->
		<cffunction name="update" returntype="boolean" hint="update a team">
			<!---method arguments --->
			<cfargument name="team_id" type="numeric" required="yes" hint="team ID">
			<cfargument name="team_name" type="string" required="yes" hint="team name">
			<cfargument name="team_desc" type="string" required="yes" hint="team description">
			<cfargument name="team_size" type="string" required="yes" hint="team size">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID">
			
			<!---update team --->
			<cfquery>
				UPDATE teams
				SET team_name='#Trim(ARGUMENTS.team_name)#',
					team_desc='#Trim(ARGUMENTS.team_desc)#',
					team_size='#Trim(ARGUMENTS.team_size)#',
					company_id=#ARGUMENTS.company_id#
				WHERE team_id=#ARGUMENTS.team_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a team --->
		<cffunction name="delete" returntype="boolean" hint="delete a team">
			<cfargument name="team_id" type="numeric" required="yes" hint="team ID" >
			<cfquery>
				DELETE FROM teams
				WHERE team_id=#ARGUMENTS.team_id#
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