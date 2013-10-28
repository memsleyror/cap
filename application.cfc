<cfcomponent output="false" >
	
	<!--- application name --->
	<cfset this.name = "CAP">
	
	
	<!---default datasource --->
	<cfset this.datasource="CAP_DEV">

	<!---turn on session management --->
	<cfset this.sessionManagement=true>
	
	<cffunction name="onRequestStart" output="false" returntype="void">
	
		<!---if user isn't logged in, force them to now --->
		<cfif not isDefined("session.auth.isLoggedIn")>
			<!---if user is now submitting the login form include login check --->
			<cfif isDefined("form.user_login")>
				<cfinclude template="loginCheck.cfm" >
			</cfif>
			
			<cfinclude template="loginForm.cfm" >
			<cfabort>	
		</cfif>
	</cffunction>

</cfcomponent>