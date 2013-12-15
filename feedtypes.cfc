<cfcomponent>

		<!---list of all feedtypes --->
		<cffunction name="list" returntype="query" hint="list all feedtypes" > 
			<cfquery name="feedtypes">
				SELECT feedtype_id, feedtype_name
				FROM feedtypes
				ORDER BY feedtype_name
			</cfquery>
			<cfreturn feedtypes>	 
		</cffunction>

		<!---get a specific feedtype --->
		<cffunction name="get" returntype="query" hint="get feedtype details">
			<cfargument name="feedtype_id" type="numeric" required="yes" hint="feedtype ID" >
			<cfquery name="feedtype">
				SELECT feedtype_id, feedtype_name, feedtype_icon, feedtype_button
				FROM feedtypes
				WHERE feedtype_id=#ARGUMENTS.feedtype_id#
			</cfquery>	 
			<cfreturn feedtype>
		</cffunction>
		
		<!---add a feedtype --->
		<cffunction name="add" returntype="boolean" hint="add a feedtype">
			
			<!---method arguments --->
			<cfargument name="feedtype_name" type="string" required="yes" hint="feedtype name">
			<cfargument name="feedtype_icon" type="string" required="yes" hint="feedtype icon">
			<cfargument name="feedtype_button" type="string" required="yes" hint="feedtype button">
			
			
			<!---insert feedtype --->
			<cfquery>
				INSERT INTO feedtypes(feedtype_name, feedtype_icon, feedtype_button)
				VALUES('#Trim(ARGUMENTS.feedtype_name)#',
						'#Trim(ARGUMENTS.feedtype_icon)#',
						'#Trim(ARGUMENTS.feedtype_button)#'
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		
		<!---update a feedtype --->
		<cffunction name="update" returntype="boolean" hint="update a feedtype">
			<!---method arguments --->
			<cfargument name="feedtype_id" type="numeric" required="yes" hint="feedtype ID">
			<cfargument name="feedtype_name" type="string" required="yes" hint="feedtype name">
			<cfargument name="feedtype_icon" type="string" required="yes" hint="feedtype icon">
			<cfargument name="feedtype_button" type="string" required="yes" hint="feedtype button">
		
			
			<!---update feedtype --->
			<cfquery>
				UPDATE feedtypes
				SET feedtype_name='#Trim(ARGUMENTS.feedtype_name)#',
					feedtype_icon='#Trim(ARGUMENTS.feedtype_icon)#',
					feedtype_button='#Trim(ARGUMENTS.feedtype_button)#'
				WHERE feedtype_id=#ARGUMENTS.feedtype_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>
		
		<!---delete a feedtype --->
		<cffunction name="delete" returntype="boolean" hint="delete a feedtype">
			<cfargument name="feedtype_id" type="numeric" required="yes" hint="feedtype ID" >
			<cfquery>
				DELETE FROM feedtypes
				WHERE feedtype_id=#ARGUMENTS.feedtype_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	

</cfcomponent>