<cfcomponent>
	<!---list of all user stakeholdergroups --->
		<cffunction name="list" returntype="query" hint="list all user stakeholdergroups" > 
			<cfquery name="userstakeholdergroups">
				SELECT userstakeholdergroup_id, userstakeholdergroup.user_id, userstakeholdergroup.stakeholdergroup_id, stakeholdergroups.stakeholdergroup_name, users.user_lastname
				FROM (userstakeholdergroup INNER JOIN users ON userstakeholdergroup.user_id = users.user_id) INNER JOIN stakeholdergroups ON userstakeholdergroup.stakeholdergroup_id = stakeholdergroups.stakeholdergroup_id
				ORDER BY userstakeholdergroup_id
			</cfquery>
			<cfreturn userstakeholdergroups>	 
		</cffunction>
		
		<!---get a specific userstakeholdergroup --->
		<cffunction name="get" returntype="query" hint="get user stakeholdergroup details">
			<cfargument name="userstakeholdergroup_id" type="numeric" required="yes" hint="userstakeholdergroup ID" >
			<cfquery name="userstakeholdergroup">
				SELECT userstakeholdergroup_id, user_id, stakeholdergroup_id
				FROM userstakeholdergroup
				WHERE userstakeholdergroup_id=#ARGUMENTS.userstakeholdergroup_id#
			</cfquery>	 
			<cfreturn userstakeholdergroup>
		</cffunction>

		<!---add a userstakeholdergroup --->
		<cffunction name="add" returntype="boolean" hint="add a userstakeholdergroup">
			
			<!---method arguments --->
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="stakeholdergroup_id" type="numeric" required="yes" hint="stakeholdergroup ID">
			
			<!---insert stakeholdergroup --->
			<cfquery>
				INSERT INTO userstakeholdergroup(user_id, stakeholdergroup_id)
				VALUES(#ARGUMENTS.user_id#,
						#ARGUMENTS.stakeholdergroup_id#
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		<!---update a userstakeholdergroup --->
		<cffunction name="update" returntype="boolean" hint="update a userstakeholdergroup">
			<!---method arguments --->
			<cfargument name="userstakeholdergroup_id" type="numeric" required="yes" hint="userstakeholdergroup ID">
			<cfargument name="user_id" type="numeric" required="yes" hint="user ID">
			<cfargument name="stakeholdergroup_id" type="numeric" required="yes" hint="stakeholdergroup ID">
			
			<!---update stakeholdergroup --->
			<cfquery>
				UPDATE userstakeholdergroup
				SET user_id=#ARGUMENTS.user_id#,
					stakeholdergroup_id=#ARGUMENTS.stakeholdergroup_id#
				WHERE userstakeholdergroup_id=#ARGUMENTS.userstakeholdergroup_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>

		<!---delete a userstakeholdergroup --->
		<cffunction name="delete" returntype="boolean" hint="delete a userstakeholdergroup">
			<cfargument name="userstakeholdergroup_id" type="numeric" required="yes" hint="userstakeholdergroup ID" >
			<cfquery>
				DELETE FROM userstakeholdergroup
				WHERE userstakeholdergroup_id=#ARGUMENTS.userstakeholdergroup_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	


		<!---get stakeholdergroups --->
		<cffunction name="getstakeholdergroups" returntype="query" hint="get stakeholdergroups">
			<cfquery name="stakeholdergroups">
				SELECT stakeholdergroup_id, stakeholdergroup_name
				FROM stakeholdergroups
				ORDER BY stakeholdergroup_id
			</cfquery>	
			<cfreturn stakeholdergroups>	
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