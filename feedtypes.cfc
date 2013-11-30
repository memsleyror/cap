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
				SELECT feedtype_id, feedtype_name, feedtype_icon
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
			
			
			<!---insert feedtype --->
			<cfquery>
				INSERT INTO feedtypes(feedtype_name, feedtype_icon)
				VALUES('#Trim(ARGUMENTS.feedtype_name)#',
						'#Trim(ARGUMENTS.feedtype_icon)#'
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
		
			
			<!---update feedtype --->
			<cfquery>
				UPDATE feedtypes
				SET feedtype_name='#Trim(ARGUMENTS.feedtype_name)#',
					feedtype_icon='#Trim(ARGUMENTS.feedtype_icon)#'
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