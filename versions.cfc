<cfcomponent>

		<!---list of all versions --->
		<cffunction name="list" returntype="query" hint="list all versions" > 
			<cfquery name="versions">
				SELECT version_id, version_name
				FROM versions
				ORDER BY version_name
			</cfquery>
			<cfreturn versions>	 
		</cffunction>

		<!---get a specific version --->
		<cffunction name="get" returntype="query" hint="get version details">
			<cfargument name="version_id" type="numeric" required="yes" hint="version ID" >
			<cfquery name="version">
				SELECT version_id, version_name
				FROM versions
				WHERE version_id=#ARGUMENTS.version_id#
			</cfquery>	 
			<cfreturn version>
		</cffunction>
		
		<!---add a version --->
		<cffunction name="add" returntype="boolean" hint="add a version">
			
			<!---method arguments --->
			<cfargument name="version_name" type="string" required="yes" hint="version name">
			
			
			<!---insert version --->
			<cfquery>
				INSERT INTO versions(version_name)
				VALUES('#Trim(ARGUMENTS.version_name)#'
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		
		<!---update a version --->
		<cffunction name="update" returntype="boolean" hint="update a version">
			<!---method arguments --->
			<cfargument name="version_id" type="numeric" required="yes" hint="version ID">
			<cfargument name="version_name" type="string" required="yes" hint="version name">
		
			
			<!---update version --->
			<cfquery>
				UPDATE versions
				SET version_name='#Trim(ARGUMENTS.version_name)#'
				WHERE version_id=#ARGUMENTS.version_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>
		
		<!---delete a version --->
		<cffunction name="delete" returntype="boolean" hint="delete a version">
			<cfargument name="version_id" type="numeric" required="yes" hint="version ID" >
			<cfquery>
				DELETE FROM versions
				WHERE version_id=#ARGUMENTS.version_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	

</cfcomponent>