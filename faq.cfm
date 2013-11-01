
<cfparam name="url.project_id" default="">
<cfparam name="url.faq_id" default="">

<cfset faqs = application.faqService.getAnsweredQuestions(url.project_id)>

<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		FAQ
		
		<small>
			<i class="icon-double-angle-right"></i>
			Questions about your project
		</small>
		
	</h1>
</div>

<div id="faq-list" class="panel-group accordion-style1 accordion-style2">
	<cfoutput query="faqs">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">

<a href="##faq-#faq_id#" data-parent="##faq-list" data-toggle="collapse" class="accordion-toggle <cfif faq_id neq url.faq_id>colapsed</cfif>">
<i class="icon-chevron-left pull-right" data-icon-hide="icon-chevron-down" data-icon-show="icon-chevron-left"></i>
<i class="icon-user bigger-130"></i>
&nbsp; #question#
</a>
<!---
				<a class="accordion-toggle <cfif faq_id neq url.faq_id>colapsed</cfif>" data-toggle="collapse" data-parent="##accordion" href="##collapse#faq_id#">
					<i class="icon-angle-down bigger-110" data-icon-hide="icon-angle-down" data-icon-show="icon-angle-right"></i>
					&nbsp;#question#
--->
				</a>
			</h4>
		</div>

		<div class="panel-collapse collapse <cfif faq_id eq url.faq_id>in</cfif>" id="faq-#faq_id#">
			<div class="panel-body">
				#answer#
			</div>
		</div>
	</div>
	</cfoutput>

	<!---
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
					<i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down" data-icon-show="icon-angle-right"></i>
					&nbsp;Group Item #2
				</a>
			</h4>
		</div>

		<div class="panel-collapse collapse" id="collapseTwo">
			<div class="panel-body">
				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wole ea proident.
			</div>
		</div>
	</div>
	--->

</div>

<cfinclude template="footer.cfm">
