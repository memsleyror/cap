<cfcomponent>

		<!---list of all roles --->
		<cffunction name="list" returntype="query" hint="list all roles" > 
			<cfquery name="roles">
				SELECT role_id, role_name
				FROM roles
				ORDER BY role_name
			</cfquery>
			<cfreturn roles>	 
		</cffunction>

		<!---get a specific role --->
		<cffunction name="get" returntype="query" hint="get role details">
			<cfargument name="role_id" type="numeric" required="yes" hint="role ID" >
			<cfquery name="role">
				SELECT role_id, role_name, role_desc
				FROM roles
				WHERE role_id=#ARGUMENTS.role_id#
			</cfquery>	 
			<cfreturn role>
		</cffunction>
		
		<!---add a role --->
		<cffunction name="add" returntype="boolean" hint="add a role">
			
			<!---method arguments --->
			<cfargument name="role_name" type="string" required="yes" hint="role name">
			<cfargument name="role_desc" type="string" required="yes" hint="role description">
			
			
			<!---insert role --->
			<cfquery>
				INSERT INTO roles(role_name, role_desc)
				VALUES('#Trim(ARGUMENTS.role_name)#',
						'#Trim(ARGUMENTS.role_desc)#'
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		
		<!---update a role --->
		<cffunction name="update" returntype="boolean" hint="update a role">
			<!---method arguments --->
			<cfargument name="role_id" type="numeric" required="yes" hint="role ID">
			<cfargument name="role_name" type="string" required="yes" hint="role name">
			<cfargument name="role_desc" type="string" required="yes" hint="role description">
		
			
			<!---update role --->
			<cfquery>
				UPDATE roles
				SET role_name='#Trim(ARGUMENTS.role_name)#',
					role_desc='#Trim(ARGUMENTS.role_desc)#'
				WHERE role_id=#ARGUMENTS.role_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>
		
		<!---delete a role --->
		<cffunction name="delete" returntype="boolean" hint="delete a role">
			<cfargument name="role_id" type="numeric" required="yes" hint="role ID" >
			<cfquery>
				DELETE FROM roles
				WHERE role_id=#ARGUMENTS.role_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	

</cfcomponent>