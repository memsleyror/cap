<cfcomponent>

		<!---list of all tasktypes --->
		<cffunction name="list" returntype="query" hint="list all tasktypes" > 
			<cfquery name="tasktypes">
				SELECT tasktype_id, tasktype
				FROM tasktype
				ORDER BY tasktype
			</cfquery>
			<cfreturn tasktypes>	 
		</cffunction>

		<!---get a specific tasktype --->
		<cffunction name="get" returntype="query" hint="get tasktype details">
			<cfargument name="tasktype_id" type="numeric" required="yes" hint="tasktype ID" >
			<cfquery name="tasktype">
				SELECT tasktype_id, tasktype
				FROM tasktype
				WHERE tasktype_id=#ARGUMENTS.tasktype_id#
			</cfquery>	 
			<cfreturn tasktype>
		</cffunction>
		
		<!---add a tasktype --->
		<cffunction name="add" returntype="boolean" hint="add a tasktype">
			
			<!---method arguments --->
			<cfargument name="tasktype" type="string" required="yes" hint="tasktype name">
			
			
			<!---insert tasktype --->
			<cfquery>
				INSERT INTO tasktype(tasktype)
				VALUES('#Trim(ARGUMENTS.tasktype)#'
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		
		<!---update a tasktype --->
		<cffunction name="update" returntype="boolean" hint="update a tasktype">
			<!---method arguments --->
			<cfargument name="tasktype_id" type="numeric" required="yes" hint="tasktype ID">
			<cfargument name="tasktype" type="string" required="yes" hint="tasktype name">
		
			
			<!---update tasktype --->
			<cfquery>
				UPDATE tasktype
				SET tasktype='#Trim(ARGUMENTS.tasktype)#'
				WHERE tasktype_id=#ARGUMENTS.tasktype_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>
		
		<!---delete a tasktype --->
		<cffunction name="delete" returntype="boolean" hint="delete a tasktype">
			<cfargument name="tasktype_id" type="numeric" required="yes" hint="tasktype ID" >
			<cfquery>
				DELETE FROM tasktype
				WHERE tasktype_id=#ARGUMENTS.tasktype_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	

</cfcomponent>