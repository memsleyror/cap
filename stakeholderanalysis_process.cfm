<!---edit or update --->

<cfif IsDefined("FORM.stakeholderanalysis_id")>
	<cfset method="update">
<cfelse>
	<cfset method="add">
</cfif>

<cfinvoke component="stakeholderanalysis" method="#method#" >

	<!---user ID only if update method --->
	<cfif IsDefined("FORM.stakeholderanalysis_id")>
		<cfinvokeargument name="stakeholderanalysis_id" value="#FORM.stakeholderanalysis_id#">
	</cfif>
	
	<cfinvokeargument name="stakeholderanalysis_impact" value="#Trim(FORM.stakeholderanalysis_impact)#">
	<cfinvokeargument name="stakeholderanalysis_strategy" value="#Trim(FORM.stakeholderanalysis_strategy)#">
	<cfinvokeargument name="stakeholderanalysis_date" value="#DateFormat(FORM.stakeholderanalysis_date)#">
	<cfinvokeargument name="stakeholdergroup_id" value="#Int(FORM.stakeholdergroup_id)#">
	
	
</cfinvoke>

<cflocation url="stakeholderanalysis.cfm" >		 	