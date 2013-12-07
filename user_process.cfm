<!---edit or update --->

<cfif IsDefined("FORM.user_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<!--- do special handling of the image, if it exists --->
<!--- currently just for existing users --->
<cfset imageFile = "">
<cfif structKeyExists(form, "user_id")>
	<cfif structKeyExists(form, "newimage") and len(form.newimage)>
		<cffile action="upload" destination="#getTempDirectory()#" accept="image/jpg,image/jpeg,image/png,image/gif" nameConflict="makeunique" result="upload">

		<cfif upload.filewassaved>
			<!--- resize to 150x150 --->
			<cfset newId = replace(createUUID(), "-","_","all")>
			<cfset tmpFile = upload.serverdirectory & "/" & upload.serverfile>
			<cfset img = imageRead(tmpFile)>
			<cfset imageScaleToFit(img, 150, 150)>
			<cfset imageWrite(img, expandPath("./images/profiles/#form.user_id#_#newId#.jpg"))>
			<cfset imageFile = form.user_id & "_" & newId & ".jpg">
			<!--- clean up old --->
			<cfif len(session.auth.image_file) and fileExists(expandPath("./images/profiles/#session.auth.image_file#"))>
				<cfset fileDelete(expandPath("./images/profiles/#session.auth.image_file#"))>
			</cfif>
		</cfif>
	</cfif>
</cfif>

<cfinvoke component="users" method="#method#" >

	<!---user ID only if update method --->
	<cfif IsDefined("FORM.user_id")>
		<cfinvokeargument name="user_id" value="#FORM.user_id#">
	</cfif>
	
	<cfinvokeargument name="user_login" value="#Trim(FORM.user_login)#">
	<cfinvokeargument name="user_password" value="#Trim(FORM.user_password)#">
	<cfinvokeargument name="user_firstname" value="#Trim(FORM.user_firstname)#">
	<cfinvokeargument name="user_lastname" value="#Trim(FORM.user_lastname)#">
	<cfinvokeargument name="user_email" value="#Trim(FORM.user_email)#">
	<cfinvokeargument name="role_id" value="#Int(FORM.role_id)#">
	<cfinvokeargument name="image_file" value="#imageFile#">
	<!--- <cfinvokeargument name="user_default_project_id" value="#Int(FORM.user_default_project_id)#">--->
	
	<cfset session.auth.user_firstname = form.user_firstname>
	<cfset session.auth.user_lastname = form.user_lastname>
	<cfif imageFile neq "">
		<cfset session.auth.image_file = imageFile>
	</cfif>
	
</cfinvoke>

<cflocation url="users.cfm" addToken="false">		 	