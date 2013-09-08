<!---check to see if company ID was provided --->

<cfif NOT IsDefined("company_id")>
	You did not specify a company ID.
	<cfabort>
</cfif>

<!---delete role --->

<cfinvoke component="companies" method="delete" company_id="#URL.company_id#">
	
	
<cflocation url="companies.cfm">	