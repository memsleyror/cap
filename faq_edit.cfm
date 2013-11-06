<cfparam name="url.faq_id" default="">

<!--- This should be abstracted better. --->
<cfif not session.auth.role_id eq 2>
	<cflocation url="/" addToken="false">
</cfif>

<cfset faq = application.faqService.getFaq(url.faq_id)>

<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		FAQ Edit
				
	</h1>
</div>

<cfoutput>
<form class="form-horizontal" role="form" method="post">
	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="question"> Question </label>

		<div class="col-sm-9">
			<textarea id="question" class="form-control" rows="4">#htmlEditFormat(faq.question)#</textarea>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="answer"> Answer </label>

		<div class="col-sm-9">
			<textarea id="question" class="form-control" rows="4">#htmlEditFormat(faq.answer)#</textarea>
		</div>
	</div>
	<div class="form-group">
		<!---
		<label class="col-sm-3 control-label no-padding-right"> Status </label>
		--->
		<div class="col-sm-3 control-label no-padding-right"> Status </div>
		<div class="col-sm-9">
			<input type="checkbox" id="deleted"> <label for="deleted">Deleted</label><br/>
			<input type="checkbox" id="edited"> <label for="edited">Edited</label><br/>
			<input type="checkbox" id="rejected"> <label for="rejected">Rejected</label><br/>
		</div>
</form>
</cfoutput>

<cfinclude template="footer.cfm">
