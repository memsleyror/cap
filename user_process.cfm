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
			<cfset tmpFile = upload.serverdirectory & "/" & upload.serverfile>
			<cfset img = imageRead(tmpFile)>
			<cfset imageScaleToFit(img, 150, 150)>
			<cfset imageWrite(img, expandPath("./images/profiles/#form.user_id#.jpg"))>
			<cfset imageFile = form.user_id & ".jpg">
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
	
	
</cfinvoke>

<cflocation url="users.cfm" addToken="false">		 	