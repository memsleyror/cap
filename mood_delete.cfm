<!---check to see if mood ID was provided --->

<cfif NOT IsDefined("mood_id")>
	You did not specify a mood ID.
	<cfabort>
</cfif>

<!---delete mood --->

<cfinvoke component="moods" method="delete" mood_id="#URL.mood_id#">
	
	
<cflocation url="moods.cfm">	