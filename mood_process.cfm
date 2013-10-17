<!---edit or update --->

<cfif IsDefined("FORM.mood_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="moods" method="#method#" >

	<!---mood ID only if update method --->
	<cfif IsDefined("FORM.mood_id")>
		<cfinvokeargument name="mood_id" value="#FORM.mood_id#">
	</cfif>
	
	<cfinvokeargument name="mood_name" value="#Trim(FORM.mood_name)#">
	
</cfinvoke>

<cflocation url="moods.cfm" >		 	