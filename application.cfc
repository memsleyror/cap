﻿<cfcomponent output="false" >
	
	<!--- application name --->
	<cfset this.name = "CAP">
	
	
	<!---default datasource --->
	<cfset this.datasource="CAP_DEV">

	<!---turn on session management --->
	<cfset this.sessionManagement=true>
	
	<cffunction name="onApplicationStart" output="false" returnType="boolean">
		<cfset application.faqService = createObject("component", "model.faqservice")>
		<cfset application.taskService = createObject("component", "model.taskservice")>
		<cfset application.utils = createObject("component", "model.utils")>
		<cfset application.userService = createObject("component", "model.userservice")>

		<cfset application.taskService.setUserService(application.userService)>
		
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart" output="false" returntype="void">
		<cfargument name="page" type="string" required="true">

		<!--- temp --->
		<cfset onApplicationStart()>
		<!---if user isn't logged in, force them to now --->
		<cfif (not isDefined("session.auth.isLoggedIn") or session.auth.isLoggedin is false) and not findNoCase(".cfc", arguments.page)>

			<!---if user is now submitting the login form include login check --->
			<cfif isDefined("form.user_login")>
				<cfinclude template="loginCheck.cfm" >
			</cfif>
			
			<cfinclude template="loginForm.cfm" >
			<cfabort>	
		</cfif>
	</cffunction>

</cfcomponent>