<cfcomponent>
	<!---list of all stakeholdergroups --->
		<cffunction name="list" returntype="query" hint="list all stakeholdergroups" > 
			<cfquery name="stakeholdergroups">
				SELECT stakeholdergroup_id, stakeholdergroup_name
				FROM stakeholdergroups
				ORDER BY stakeholdergroup_name
			</cfquery>
			<cfreturn stakeholdergroups>	 
		</cffunction>
		
		<!---get a specific stakeholdergroup --->
		<cffunction name="get" returntype="query" hint="get stakeholdergroup details">
			<cfargument name="stakeholdergroup_id" type="numeric" required="yes" hint="stakeholdergroup ID" >
			<cfquery name="stakeholdergroup">
				SELECT stakeholdergroup_id, stakeholdergroup_name, stakeholdergroup_desc, stakeholdergroup_size, company_id
				FROM stakeholdergroups
				WHERE stakeholdergroup_id=#ARGUMENTS.stakeholdergroup_id#
			</cfquery>	 
			<cfreturn stakeholdergroup>
		</cffunction>

		<!---add a stakeholdergroup --->
		<cffunction name="add" returntype="boolean" hint="add a stakeholdergroup">
			
			<!---method arguments --->
			<cfargument name="stakeholdergroup_name" type="string" required="yes" hint="stakeholdergroup name">
			<cfargument name="stakeholdergroup_desc" type="string" required="yes" hint="stakeholdergroup description">
			<cfargument name="stakeholdergroup_size" type="string" required="yes" hint="stakeholdergroup size">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID">
			
			<!---insert stakeholdergroup --->
			<cfquery>
				INSERT INTO stakeholdergroups(stakeholdergroup_name, stakeholdergroup_desc, stakeholdergroup_size, company_id)
				VALUES('#Trim(ARGUMENTS.stakeholdergroup_name)#',
						'#Trim(ARGUMENTS.stakeholdergroup_desc)#',
						'#Trim(ARGUMENTS.stakeholdergroup_size)#',
						#ARGUMENTS.company_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a stakeholdergroup --->
		<cffunction name="update" returntype="boolean" hint="update a stakeholdergroup">
			<!---method arguments --->
			<cfargument name="stakeholdergroup_id" type="numeric" required="yes" hint="stakeholdergroup ID">
			<cfargument name="stakeholdergroup_name" type="string" required="yes" hint="stakeholdergroup name">
			<cfargument name="stakeholdergroup_desc" type="string" required="yes" hint="stakeholdergroup description">
			<cfargument name="stakeholdergroup_size" type="string" required="yes" hint="stakeholdergroup size">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID">
			
			<!---update stakeholdergroup --->
			<cfquery>
				UPDATE stakeholdergroups
				SET stakeholdergroup_name='#Trim(ARGUMENTS.stakeholdergroup_name)#',
					stakeholdergroup_desc='#Trim(ARGUMENTS.stakeholdergroup_desc)#',
					stakeholdergroup_size='#Trim(ARGUMENTS.stakeholdergroup_size)#',
					company_id=#ARGUMENTS.company_id#
				WHERE stakeholdergroup_id=#ARGUMENTS.stakeholdergroup_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a stakeholdergroup --->
		<cffunction name="delete" returntype="boolean" hint="delete a stakeholdergroup">
			<cfargument name="stakeholdergroup_id" type="numeric" required="yes" hint="stakeholdergroup ID" >
			<cfquery>
				DELETE FROM stakeholdergroups
				WHERE stakeholdergroup_id=#ARGUMENTS.stakeholdergroup_id#
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