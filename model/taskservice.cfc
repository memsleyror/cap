<cfcomponent output="false">

	<!---list of all tasks --->
	<cffunction name="list" returntype="query" hint="list all tasks" output="false"> 
		<cfset var tasks = "">
		<cfquery name="tasks">
			SELECT task_id, task_desc
			FROM tasks
			ORDER BY task_desc
		</cfquery>
		<cfreturn tasks>	 
	</cffunction>
	
	<!---get a specific task --->
	<cffunction name="get" returntype="query" hint="get task details" output="false">
		<cfargument name="task_id" type="numeric" required="yes" hint="task ID" >
		<cfset var task = "">
		<cfquery name="task">
			SELECT task_id, task_desc, project_id, task_start_date, task_end_date, tasktype_id
			FROM tasks
			WHERE task_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.task_id#">
		</cfquery>	 
		<cfreturn task>
	</cffunction>
		
	<!--- get user specific tasks based on session user id 			
	<cffunction name="getmine" returntype="query" hint="get my tasks" output="false">
		<cfset var mytasks = "">
		<cfquery name="mytasks">	
			SELECT tasks.task_id, tasks.task, users.user_lastname, users.user_id, usertask.usertask_id
			FROM tasks INNER JOIN usertask ON tasks.task_id = usertask.task_id
	 		INNER JOIN users ON usertask.user_id = users.user_id
	 		WHERE users.user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.auth.user_id#">
		</cfquery>
		<cfreturn mytasks>
	</cffunction>	
	--->
		
	<!---add a task --->
	<cffunction name="add" returntype="boolean" hint="add a task" output="false">
		
		<!---method arguments --->
		<cfargument name="task_desc" type="string" required="yes" hint="task name">
		<cfargument name="project_id" type="numeric" required="yes" hint="project id">
		<cfargument name="task_start_date" type="date" required="yes" hint="task start date">
		<cfargument name="task_end_date" type="date" required="yes" hint="task end date">
		<cfargument name="tasktype_id" type="numeric" required="yes" hint="tasktype ID">
		
		<!---insert task --->
		<cfquery>
			INSERT INTO tasks(task_desc, project_id, task_start_date, task_end_date, tasktype_id)
			VALUES(<cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(ARGUMENTS.task_desc)#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.project_id#">,
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#CreateODBCDate(ARGUMENTS.task_start_date)#">,
					<cfqueryparam cfsqltype="cf_sql_timestap" value="#CreateODBCDate(ARGUMENTS.task_end_date)#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.tasktype_id#">
			)
		</cfquery>	
		<cfreturn true>
	</cffunction>	
		
	<!---update a task --->
	<cffunction name="update" returntype="boolean" hint="update a task" output="false">
		<!---method arguments --->
		<cfargument name="task_id" type="numeric" required="yes" hint="task ID">
		<cfargument name="task_desc" type="string" required="yes" hint="task name">
		<cfargument name="project_id" type="numeric" required="yes" hint="project id">
		<cfargument name="task_start_date" type="date" required="yes" hint="task start date">
		<cfargument name="task_end_date" type="date" required="yes" hint="task end date">
		<cfargument name="tasktype_id" type="numeric" required="yes" hint="tasktype ID">
		
		<!---update task --->
		<cfquery>
			UPDATE tasks
			SET task_desc=<cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(ARGUMENTS.task_desc)#">,
				project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.project_id#">,
				task_start_date=<cfqueryparam cfsqltype="cf_sql_timestamp" value="#CreateODBCDate(ARGUMENTS.task_start_date)#">,
				task_end_date=<cfqueryparam cfsqltype="cf_sql_timestamp" value="#CreateODBCDate(ARGUMENTS.task_end_date)#">,
				tasktype_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.tasktype_id#">
			WHERE task_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.task_id#">
		</cfquery>				
		<cfreturn true>
	</cffunction>
		
	<!---delete a task --->
	<cffunction name="delete" returntype="boolean" hint="delete a task" output="false">
		<cfargument name="task_id" type="numeric" required="yes" hint="task ID" >
		<cfquery>
			DELETE FROM tasks
			WHERE task_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.task_id#">
		</cfquery> 
		<cfreturn true>
	</cffunction>	

	<!---get tasktypes --->
	<cffunction name="getTasktypes" returntype="query" hint="get tasktypes" output="false">
		<cfset var tasktypes = "">
		<cfquery name="tasktypes">
			SELECT tasktype_id, tasktype
			FROM tasktype
			ORDER BY tasktype_id
		</cfquery>	
		<cfreturn tasktypes>	
	</cffunction>
		
	<!---get projects --->
	<cffunction name="getProjects" returntype="query" hint="get projects" output="false">
		<cfset var project = "">
		<cfquery name="projects">
			SELECT project_id, project_name
			FROM projects
			ORDER BY project_id
		</cfquery>	
		<cfreturn projects>	
	</cffunction>

</cfcomponent>