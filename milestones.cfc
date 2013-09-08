<cfcomponent>

	<!---list of all milestones --->
		<cffunction name="list" returntype="query" hint="list all milestones" > 
			<cfquery name="milestones">
				SELECT milestone_id, milestone_name, milestone_date
				FROM milestones
				ORDER BY milestone_date
			</cfquery>
			<cfreturn milestones>	 
		</cffunction>
		
		<!---get a specific milestone --->
		<cffunction name="get" returntype="query" hint="get milestone details">
			<cfargument name="milestone_id" type="numeric" required="yes" hint="milestone ID" >
			<cfquery name="milestone">
				SELECT milestone_id, milestone_name, milestone_desc, milestone_date, project_id
				FROM milestones
				WHERE milestone_id=#ARGUMENTS.milestone_id#
			</cfquery>	 
			<cfreturn milestone>
		</cffunction>

		<!---add a milestone --->
		<cffunction name="add" returntype="boolean" hint="add a milestone">
			
			<!---method arguments --->
			<cfargument name="milestone_name" type="string" required="yes" hint="milestone name">
			<cfargument name="milestone_desc" type="string" required="yes" hint="milestone desc">
			<cfargument name="milestone_date" type="date" required="yes" hint="milestone_date">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			
			
			<!---insert milestone --->
			<cfquery>
				INSERT INTO milestones(milestone_name, milestone_desc, milestone_date, project_id)
				VALUES('#Trim(ARGUMENTS.milestone_name)#',
						'#Trim(ARGUMENTS.milestone_desc)#',
						#CreateODBCDate(ARGUMENTS.milestone_date)#,
						#ARGUMENTS.project_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a milestone --->
		<cffunction name="update" returntype="boolean" hint="update a milestone">
			<!---method arguments --->
			<cfargument name="milestone_id" type="numeric" required="yes" hint="milestone ID">
			<cfargument name="milestone_name" type="string" required="yes" hint="milestone name">
			<cfargument name="milestone_desc" type="string" required="yes" hint="milestone desc">
			<cfargument name="milestone_date" type="date" required="yes" hint="milestone_date">
			<cfargument name="project_id" type="numeric" required="yes" hint="project ID">
			
			<!---update milestone --->
			<cfquery>
				UPDATE milestones
				SET milestone_name='#Trim(ARGUMENTS.milestone_name)#',
					milestone_desc='#Trim(ARGUMENTS.milestone_desc)#',
					milestone_date=#CreateODBCDate(ARGUMENTS.milestone_date)#,
					project_id=#ARGUMENTS.project_id#
				WHERE milestone_id=#ARGUMENTS.milestone_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a milestone --->
		<cffunction name="delete" returntype="boolean" hint="delete a milestone">
			<cfargument name="milestone_id" type="numeric" required="yes" hint="milestone ID" >
			<cfquery>
				DELETE FROM milestones
				WHERE milestone_id=#ARGUMENTS.milestone_id#
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

</cfcomponent>