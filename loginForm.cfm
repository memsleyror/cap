<!---page header --->
<!--- <cfinclude template="header.cfm">--->

		<!---if user is now submitting the login form include login check --->
			<cfif isDefined("form.user_login")>
				<cfinclude template="loginCheck.cfm" >
			</cfif>
	
		<html>
			<head><title>Please log in</title></head>
			
			<!---put cursor in login field --->
			<body onLoad="document.loginForm.user_login.focus();">
				
			<!---start form --->	
				
			<cfform action="#cgi.script_name#?#cgi.qUERY_STRING#" name="loginForm" method="post" >	
				
				<table>
					<tr>
						<td>Username</td>
						<td><cfinput name="user_login" type="text" size="20" value="" maxlength="100" required="true" message="please enter username"></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><cfinput name="user_password" type="password" size="12" value="" maxlength="100" required="true" message="please enter password"></td>
					</tr>
					<tr>
						<td>
						<input type="submit" value="Enter">
						</td>
					</tr>
					
				</table>
				
			</cfform>	
				
				
			</body>
			
		</html>	


<!---page header --->
<!--- <cfinclude template="footer.cfm">--->