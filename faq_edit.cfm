<cfparam name="url.faq_id" default="">

<!--- This should be abstracted better. --->
<cfif not session.auth.role_id eq 2>
	<cflocation url="/" addToken="false">
</cfif>

<cfset faq = application.faqService.getFaq(url.faq_id)>

<cfif structKeyExists(form, "cancel")>
	<cflocation url="faq.cfm?project_id=#faq.projectidfk#&faq_id=#faq.faq_id#" addToken="false">
</cfif>

<cfif structKeyExists(form, "save")>
	<cfset faq = {}>
	<cfset faq.question = form.question>
	<cfset faq.answer = form.answer>
	<cfset faq.deleted = structKeyExists(form,"deleted")>
	<cfset faq.rejected = structKeyExists(form,"rejected")>
	<cfset faq.edited = structKeyExists(form,"edited")>
	<cfset faq.faq_id = url.faq_id>
	<cfset application.faqService.updateFaq(faq)>
	<cflocation url="faq_edit.cfm?faq_id=#faq.faq_id#&showsuccess=1" addToken="false">
</cfif>

<cfinclude template="header.cfm">

<div class="page-header">
	<h1>
		FAQ Edit		
	</h1>
</div>

<cfif structKeyExists(url, "showsuccess")>
	<div class="alert alert-block alert-success">
		<button type="button" class="close" data-dismiss="alert">
			<i class="icon-remove"></i>
		</button>

		<p>
			<strong>
				<i class="icon-ok"></i>
				FAQ Saved
			</strong>
		</p>
	</div>
</cfif>

<cfoutput>
<form class="form-horizontal" role="form" method="post">
	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="question"> Question </label>

		<div class="col-sm-9">
			<textarea id="question" name="question" class="form-control" rows="4">#htmlEditFormat(faq.question)#</textarea>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="answer"> Answer </label>

		<div class="col-sm-9">
			<textarea id="answer" name="answer" class="form-control" rows="4">#htmlEditFormat(faq.answer)#</textarea>
		</div>
	</div>
	<div class="form-group">
		<!---
		<label class="col-sm-3 control-label no-padding-right"> Status </label>
		--->
		<div class="col-sm-3 control-label no-padding-right"> Status </div>
		<div class="col-sm-9">
			<input type="checkbox" id="deleted" name="deleted" <cfif faq.deleted>checked</cfif>> <label for="deleted">Deleted</label><br/>
			<input type="checkbox" id="edited" name="edited" <cfif faq.edited>checked</cfif>> <label for="edited">Edited</label><br/>
			<input type="checkbox" id="rejected" name="rejected" <cfif faq.rejected>checked</cfif>> <label for="rejected">Rejected</label><br/>
		</div>
	</div>

	<div class="clearfix form-actions">
		<div class="col-md-offset-3 col-md-9">
			<button class="btn btn-info" type="submit" name="save">
				<i class="icon-ok bigger-110"></i>
				Submit
			</button>

			&nbsp; &nbsp; &nbsp;
			<button class="btn" type="submit" name="cancel">
				<i class="icon-undo bigger-110"></i>
				Cancel
			</button>
		</div>
	</div>

</form>
</cfoutput>

<cfinclude template="footer.cfm">
