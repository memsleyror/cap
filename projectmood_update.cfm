<!---edit or update --->

<cfif IsDefined("FORM.userprojectmood_id")>
	<cfset method="updateMood">
	
<cfelse>
	<cfset method="addMood">
</cfif>


<cfset method="updateMood">


<cfinvoke component="projects" method="#method#" >

	<!---project ID only if update method --->
	<cfif IsDefined("FORM.userprojectmood_id")>
		<cfinvokeargument name="userprojectmood_id" value="#Int(FORM.userprojectmood_id)#">
	</cfif>
	
	<cfinvokeargument name="mood_id" value="#Int(FORM.mood_id)#">

</cfinvoke>

<cflocation url="project_dashboard.cfm" >		 		