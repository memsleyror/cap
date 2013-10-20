
<!---make it dependent on which button i click --->


<!---edit or update --->

<cfif IsDefined("FORM.userprojectmood_id")>
	<cfset method="updateMood">
	
<cfelse>
	<cfset method="addMood">
</cfif>


<!--- <cfset method="updateMood">--->


<cfinvoke component="projects" method="#method#" >

	<!---project ID only if update method --->
	<cfif IsDefined("FORM.userprojectmood_id")>
		<cfinvokeargument name="userprojectmood_id" value="#Int(FORM.userprojectmood_id)#">
	</cfif>
	
	<!---1=neutral, 2=positive, 3=negative, 4=confused --->
	<cfif IsDefined("FORM.button_pos")>
		<cfinvokeargument name="mood_id" value=2>
		<!--- <cfinvokeargument name="mood_id" value="#Int(FORM.mood_id)#">--->
	<cfelseif IsDefined("FORM.button_neg")>
		<cfinvokeargument name="mood_id" value=3>
	<cfelseif IsDefined("FORM.button_confused")>
		<cfinvokeargument name="mood_id" value=4>
	<cfelseif IsDefined("FORM.button_neutral")>
		<cfinvokeargument name="mood_id" value=1>
	</cfif>

</cfinvoke>

<cflocation url="project_dashboard.cfm" >		 		