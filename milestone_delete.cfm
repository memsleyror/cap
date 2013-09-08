<!---check to see if milestone ID was provided --->

<cfif NOT IsDefined("milestone_id")>
	You did not specify a milestone ID.
	<cfabort>
</cfif>

<!---delete user --->

<cfinvoke component="milestones" method="delete" milestone_id="#URL.milestone_id#">
	
	
<cflocation url="milestones.cfm">	