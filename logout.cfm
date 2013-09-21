	<cfset session.auth.isLoggedIn = "No">
	<cfset session.auth.user_id = "">
	<cfset session.auth.user_firstname = "">
	<cfset session.auth.user_lastname = "">
	
	<cflocation url="loginForm.cfm" >