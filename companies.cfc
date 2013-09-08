<cfcomponent>
	<!---list of all companies --->
		<cffunction name="list" returntype="query" hint="list all companies" > 
			<cfquery name="companies">
				SELECT company_id, company_name
				FROM company
				ORDER BY company_name
			</cfquery>
			<cfreturn companies>	 
		</cffunction>

		<!---get a specific company --->
		<cffunction name="get" returntype="query" hint="get company details">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID" >
			<cfquery name="company">
				SELECT company_id, company_name, company_desc
				FROM company
				WHERE company_id=#ARGUMENTS.company_id#
			</cfquery>	 
			<cfreturn company>
		</cffunction>
		
		<!---add a company --->
		<cffunction name="add" returntype="boolean" hint="add a company">
			
			<!---method arguments --->
			<cfargument name="company_name" type="string" required="yes" hint="company name">
			<cfargument name="company_desc" type="string" required="yes" hint="company description">
			
			
			<!---insert company --->
			<cfquery>
				INSERT INTO company(company_name, company_desc)
				VALUES('#Trim(ARGUMENTS.company_name)#',
						'#Trim(ARGUMENTS.company_desc)#'
				)
			</cfquery>	
			<cfreturn true>
		</cffunction>	
		
		
		<!---update a company --->
		<cffunction name="update" returntype="boolean" hint="update a company">
			<!---method arguments --->
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID">
			<cfargument name="company_name" type="string" required="yes" hint="company name">
			<cfargument name="company_desc" type="string" required="yes" hint="company description">
		
			
			<!---update company --->
			<cfquery>
				UPDATE company
				SET company_name='#Trim(ARGUMENTS.company_name)#',
					company_desc='#Trim(ARGUMENTS.company_desc)#'
				WHERE company_id=#ARGUMENTS.company_id#
			</cfquery>				
			<cfreturn true>
		</cffunction>
		
		<!---delete a company --->
		<cffunction name="delete" returntype="boolean" hint="delete a company">
			<cfargument name="company_id" type="numeric" required="yes" hint="company ID" >
			<cfquery>
				DELETE FROM company
				WHERE company_id=#ARGUMENTS.company_id#
			</cfquery> 
			<cfreturn true>
		</cffunction>	

</cfcomponent>