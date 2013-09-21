
<!---make sure we have login and pw --->

<cfparam name="form.user_login" type="string" >
<cfparam name="form.user_password" type="string" >

<!---find record with this username and pw, if no record then pw not valid --->

<cfquery name="getUser">
	SELECT user_id, user_firstname, user_lastname
	FROM users
	WHERE user_login = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.user_login#" >
	AND user_password =  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.user_password#" >
</cfquery>

<!---if username and pw are correct --->

<cfif getUser.recordCount eq 1>
	<cfset session.auth = structNew()>
	<cfset session.auth.isLoggedIn = "Yes">
	<cfset session.auth.user_id = getUser.user_id>
	<cfset session.auth.user_firstname = getUser.user_firstname>
	<cfset session.auth.user_lastname = getUser.user_lastname>
	
	<cflocation url="home.cfm" >
	
</cfif>	