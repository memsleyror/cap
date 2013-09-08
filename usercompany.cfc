<cfcomponent>
	<!---list of all user companies --->
		<cffunction name="list" returntype="query" hint="list all user companies" > 
			<cfquery name="usercompanies">
				SELECT usercompany_id, usercompany.user_id, usercompany.company_id, company.company_name, users.user_lastname
				FROM (usercompany INNER JOIN users ON usercompany.user_id = users.user_id) INNER JOIN company ON usercompany.company_id = company.company_id
				ORDER BY usercompany_id
			</cfquery>
			<cfreturn usercompanies>	 
		</cffunction>
		
		<!---get a specific usercompany --->
		<cffunction name="get" returntype="query" hint="get user company details">
			<cfargument name="usercompany_id" type="numeric" required="yes" hint="usercompany ID" >
			<cfquery name="usercompany">
				SELECT usercompany_id, user_id, company_id
				FROM usercompany
				WHERE usercompany_id=#ARGUMENTS.usercompany_id#
			</cfquery>	 
			<cfreturn usercompany>
		</cffunction>

		<!---add a usercompany --->
		<cffunction name="add" returntype="boolean" hint="add a usercompany">
			
			<!---method arguments --->
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID">
			
			<!---insert team --->
			<cfquery>
				INSERT INTO usercompany(user_id, company_id)
				VALUES(#ARGUMENTS.user_id#,
						#ARGUMENTS.company_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a usercompany --->
		<cffunction name="update" returntype="boolean" hint="update a usercompany">
			<!---method arguments --->
			<cfargument name="usercompany_id" type="numeric" required="yes" hint="usercompany ID">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID">
			
			<!---update team --->
			<cfquery>
				UPDATE usercompany
				SET user_id=#ARGUMENTS.user_id#,
					company_id=#ARGUMENTS.company_id#
				WHERE usercompany_id=#ARGUMENTS.usercompany_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a team --->
		<cffunction name="delete" returntype="boolean" hint="delete a usercompany">
			<cfargument name="usercompany_id" type="numeric" required="yes" hint="usercompany ID" >
			<cfquery>
				DELETE FROM usercompany
				WHERE usercompany_id=#ARGUMENTS.usercompany_id#
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