<cfcomponent output="false">

	<!--- handles role assignment for tasks --->
	<cffunction name="assignRolesForTask" returnType="void" output="false">
		<cfargument name="task_id" type="numeric" required="true">
		<cfargument name="roles" type="string" required="true">
		<cfset var id = "">

		<cfquery>
		delete from tasks_roles
		where task_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.task_id#">
		</cfquery>

		<cfloop index="id" list="#arguments.roles#">
			<cfquery>
			insert into tasks_roles(task_id, role_id)
			values(
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.task_id#">,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#id#">
			)
			</cfquery>
		</cfloop>

	</cffunction>

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
	<cffunction name="get" returntype="struct" hint="get task details" output="false">
		<cfargument name="task_id" type="numeric" required="yes" hint="task ID" >
		<cfset var task = "">
		<cfset var roles = "">
		<cfset var result = structNew()>

		<cfquery name="task">
			SELECT task_id, task_desc, project_id, task_start_date, task_end_date, tasktype_id, completed
			FROM tasks
			WHERE task_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.task_id#">
		</cfquery>	 

		<cfset result.task_id = task.task_id>
		<cfset result.task_desc = task.task_desc>
		<cfset result.project_id = task.project_id>
		<cfset result.task_start_date = task.task_start_date>
		<cfset result.task_end_date = task.task_end_date>
		<cfset result.tasktype_id = task.tasktype_id>
		<cfset result.completed = task.completed>

		<!--- handle getting the role list --->
		<cfquery name="roles">
		select role_id
		from tasks_roles
		where task_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.task_id#">
		</cfquery>

		<cfset result.roles = valueList(roles.role_id)>
		<cfreturn result>
	</cffunction>
		
	<cffunction name="getTasksByRoleProject" returnType="struct" hint="Returns tasks based on a role." output="false">
		<cfargument name="role" type="numeric" required="true">
		<cfargument name="project" type="numeric" required="true">
		<cfset var q = "">
		<cfset var result = {}>
		<cfset var task = "">

		<cfset result.open = []>
		<cfset result.completed = []>

		<cfquery name="q">
			select t.task_id, t.task_desc, t.task_start_date, t.task_end_date,  
			ifnull(t.completed,0) as completed, tt.tasktype, tt.tasktype_label, 
			t.date_completed
			from tasks t left join tasktype tt on t.tasktype_id = tt.tasktype_id
			where 
			project_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.project#">
			and task_id in 
				(
					select task_id 
					from tasks_roles 
					where role_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.role#"> 
				);
		</cfquery>
		<cfloop query="q">
			<cfset task = { id=task_id, 
							desc=task_desc, 
							start_date=task_start_date,
							end_date=task_end_date, 
							type=tasktype,
							tasktype_label=tasktype_label,
							date_completed=date_completed
						}>
			<cfif completed>
				<cfset arrayAppend(result.completed, task)>
			<cfelse>
				<cfset arrayAppend(result.open, task)>
			</cfif>
		</cfloop>

		<cfreturn result>
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
		<cfset var result = "">

		<!---insert task --->
		<cfquery result="result">
			INSERT INTO tasks(task_desc, project_id, task_start_date, task_end_date, tasktype_id)
			VALUES(<cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(ARGUMENTS.task_desc)#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.project_id#">,
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#CreateODBCDate(ARGUMENTS.task_start_date)#">,
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#CreateODBCDate(ARGUMENTS.task_end_date)#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.tasktype_id#">
			)
		</cfquery>	

		<cfset assignRolesForTask(result.generatedkey, arguments.roles)>

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
		<cfargument name="roles" type="string" required="yes" hint="List of role IDs">
		<cfargument name="completed" type="boolean" required="no" hint="Completed status">

		<!---update task --->
		<cfquery>
			UPDATE tasks
			SET task_desc=<cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(ARGUMENTS.task_desc)#">,
				project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.project_id#">,
				task_start_date=<cfqueryparam cfsqltype="cf_sql_timestamp" value="#CreateODBCDate(ARGUMENTS.task_start_date)#">,
				task_end_date=<cfqueryparam cfsqltype="cf_sql_timestamp" value="#CreateODBCDate(ARGUMENTS.task_end_date)#">,
				tasktype_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.tasktype_id#">
				<cfif structKeyExists(arguments,"completed")>
					,completed=<cfqueryparam cfsqltype="cf_sql_boolean" value="#ARGUMENTS.completed?1:0#">
					,date_completed=curdate()
				</cfif>
			WHERE task_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.task_id#">
		</cfquery>	

		<cfset assignRolesForTask(arguments.task_id, arguments.roles)>

		<cfreturn true>
	</cffunction>
		
	<!---delete a task --->
	<cffunction name="delete" returntype="boolean" hint="delete a task" output="false">
		<cfargument name="task_id" type="numeric" required="yes" hint="task ID" >
		<cfquery>
			DELETE FROM tasks
			WHERE task_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.task_id#">
		</cfquery> 

		<cfset assignRolesForTask(arguments.task_id, "")>

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