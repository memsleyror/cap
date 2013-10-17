<cfcomponent>

		<!---list of all moods --->
		<cffunction name="list" returntype="query" hint="list all moods" > 
			<cfquery name="moods">
				SELECT mood_id, mood_name
				FROM mood
				ORDER BY mood_name
			</cfquery>
			<cfreturn moods>	 
		</cffunction>

		<!---get a specific mood --->
		<cffunction name="get" returntype="query" hint="get mood details">
			<cfargument name="mood_id" type="numeric" required="yes" hint="mood ID" >
			<cfquery name="mood">
				SELECT mood_id, mood_name
				FROM mood
				WHERE mood_id=#ARGUMENTS.mood_id#
			</cfquery>	 
			<cfreturn mood>
		</cffunction>
		
		<!---add a mood --->
		<cffunction name="add" returntype="boolean" hint="add a mood">
			
			<!---method arguments --->
			<cfargument name="mood_name" type="string" required="yes" hint="mood name">
			
			
			<!---insert mood --->
			<cfquery>
				INSERT INTO mood(mood_name)
				VALUES('#Trim(ARGUMENTS.mood_name)#'
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		
		<!---update a mood --->
		<cffunction name="update" returntype="boolean" hint="update a mood">
			<!---method arguments --->
			<cfargument name="mood_id" type="numeric" required="yes" hint="mood ID">
			<cfargument name="mood_name" type="string" required="yes" hint="mood name">
		
			
			<!---update mood --->
			<cfquery>
				UPDATE mood
				SET mood_name='#Trim(ARGUMENTS.mood_name)#'
				WHERE mood_id=#ARGUMENTS.mood_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>
		
		<!---delete a mood --->
		<cffunction name="delete" returntype="boolean" hint="delete a mood">
			<cfargument name="mood_id" type="numeric" required="yes" hint="mood ID" >
			<cfquery>
				DELETE FROM mood
				WHERE mood_id=#ARGUMENTS.mood_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	

</cfcomponent>