<cfcomponent>

	<!---list of all stakeholder analyses --->
		<cffunction name="list" returntype="query" hint="list all stakeholder analyses" > 
			<cfquery name="stakeholderanalyses">
				SELECT stakeholderanalysis_id, stakeholderanalysis_impact, stakeholderanalysis_strategy, stakeholderanalysis_date, stakeholdergroups.stakeholdergroup_id, stakeholdergroups.stakeholdergroup_name
				FROM stakeholderanalysis INNER JOIN stakeholdergroups ON stakeholderanalysis.stakeholdergroup_id = stakeholdergroups.stakeholdergroup_id
				ORDER BY stakeholderanalysis_date
			</cfquery>
			<cfreturn stakeholderanalyses>	 
		</cffunction>
		
		<!---get a specific stakeholderanalysis --->
		<cffunction name="get" returntype="query" hint="get case for change details">
			<cfargument name="stakeholderanalysis_id" type="numeric" required="yes" hint="stakeholderanalysis ID" >
			<cfquery name="stakeholderanalysis">
				SELECT stakeholderanalysis_id, stakeholderanalysis_impact, stakeholderanalysis_strategy, stakeholderanalysis_date, stakeholdergroup_id
				FROM stakeholderanalysis
				WHERE stakeholderanalysis_id=#ARGUMENTS.stakeholderanalysis_id#
			</cfquery>	 
			<cfreturn stakeholderanalysis>
		</cffunction>

		<!---add a stakeholderanalysis --->
		<cffunction name="add" returntype="boolean" hint="add a stakeholderanalysis">
			
			<!---method arguments --->
			<cfargument name="stakeholderanalysis_impact" type="string" required="yes" hint="stakeholderanalysis impact">
			<cfargument name="stakeholderanalysis_strategy" type="string" required="yes" hint="stakeholderanalysis strategy">
			<cfargument name="stakeholderanalysis_date" type="date" required="yes" hint="stakeholderanalysis_date">
			<cfargument name="stakeholdergroup_id" type="numeric" required="yes" hint="stakeholdergroup_id">
			
			
			<!---insert stakeholderanalysis --->
			<cfquery>
				INSERT INTO stakeholderanalysis(stakeholderanalysis_impact, stakeholderanalysis_strategy, stakeholderanalysis_date, stakeholdergroup_id)
				VALUES('#Trim(ARGUMENTS.stakeholderanalysis_impact)#',
						'#Trim(ARGUMENTS.stakeholderanalysis_strategy)#',
						#CreateODBCDate(ARGUMENTS.stakeholderanalysis_date)#,
						#ARGUMENTS.stakeholdergroup_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a stakeholderanalysis --->
		<cffunction name="update" returntype="boolean" hint="update a stakeholderanalysis">
			<!---method arguments --->
			<cfargument name="stakeholderanalysis_id" type="numeric" required="yes" hint="stakeholderanalysis ID">
			<cfargument name="stakeholderanalysis_impact" type="string" required="yes" hint="stakeholderanalysis impact">
			<cfargument name="stakeholderanalysis_strategy" type="string" required="yes" hint="stakeholderanalysis strategy">
			<cfargument name="stakeholderanalysis_date" type="date" required="yes" hint="stakeholderanalysis_date">
			<cfargument name="stakeholdergroup_id" type="numeric" required="yes" hint="stakeholdergroup_id ID">
			
			
			<!---update stakeholderanalysis --->
			<cfquery>
				UPDATE stakeholderanalysis
				SET stakeholderanalysis_impact='#Trim(ARGUMENTS.stakeholderanalysis_impact)#',
					stakeholderanalysis_strategy='#Trim(ARGUMENTS.stakeholderanalysis_strategy)#',
					stakeholderanalysis_date=#CreateODBCDate(ARGUMENTS.stakeholderanalysis_date)#,
					stakeholdergroup_id=#ARGUMENTS.stakeholdergroup_id#
				WHERE stakeholderanalysis_id=#ARGUMENTS.stakeholderanalysis_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a stakeholderanalysis --->
		<cffunction name="delete" returntype="boolean" hint="delete a stakeholderanalysis">
			<cfargument name="stakeholderanalysis_id" type="numeric" required="yes" hint="stakeholderanalysis ID" >
			<cfquery>
				DELETE FROM stakeholderanalysis
				WHERE stakeholderanalysis_id=#ARGUMENTS.stakeholderanalysis_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	
		
		<!---get stakeholdergroups --->
		<cffunction name="getStakeholderGroups" returntype="query" hint="get stakeholdergroups">
			<cfquery name="stakeholdergroups">
				SELECT stakeholdergroup_id, stakeholdergroup_name
				FROM stakeholdergroups
				ORDER BY stakeholdergroup_id
			</cfquery>	
			<cfreturn stakeholdergroups>	
		</cffunction>

</cfcomponent>