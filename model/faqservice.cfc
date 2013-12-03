component {

	public function getFAQs() {
		return "";
	}

	public void function addQuestion(required question, required projectidfk) {
		var q = new com.adobe.coldfusion.query();
		q.setSQL("insert into faq(question,projectidfk,datecreated) values(:question,:pid,:created)");
		q.addParam(name="question", value=arguments.question,cfsqltype="cf_sql_varchar");
		q.addParam(name="pid", value=arguments.projectidfk,cfsqltype="cf_sql_integer");
		q.addParam(name="created", value=now(),cfsqltype="cf_sql_timestamp");
		q.execute();

	}

	public struct function getFaq(required faqidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select faq_id, question, answer, rejected, deleted, edited, projectidfk, datecreated from faq where faq_id = :fid");
		q.addParam(name="fid", value=arguments.faqidfk);
		var results = q.execute().getResult();
		var faqResult = {};
		for(var i=1;i <= listLen(results.columnList); i++) {
			faqResult[listGetAt(results.columnList,i)] = results[listGetAt(results.columnList,i)][1];
		}
		//do some quick massaging of the 3 boolean flags
		if(!isBoolean(faqResult.edited)) faqResult.edited = false;
		if(!isBoolean(faqResult.deleted)) faqResult.deleted = false;
		if(!isBoolean(faqResult.rejected)) faqResult.rejected = false;
		return faqResult;
	}

	public query function getQuestions(required projectidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select faq_id, question, answer, rejected, deleted, edited, datecreated from faq where projectidfk = :pid");
		q.addParam(name="pid", value=arguments.projectidfk);
		var results = q.execute().getResult();
		return results;
	}

	public query function getAnsweredQuestions(required projectidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select faq_id, question, answer, datecreated from faq where answer is not null and (deleted is null or deleted = 0) and (rejected is null or rejected = 0) and projectidfk = :pid");
		q.addParam(name="pid", value=arguments.projectidfk);
		var results = q.execute().getResult();
		return results;
	}

	public void function updateFaq(required struct faq) {
		var q = new com.adobe.coldfusion.query();
		q.setSQL("update faq set question = :question, answer = :answer, deleted = :deleted, edited = :edited, rejected = :rejected where faq_id = :faq_id");
		q.addParam(name="question", value=arguments.faq.question,cfsqltype="cf_sql_varchar");
		q.addParam(name="answer", value=arguments.faq.answer,cfsqltype="cf_sql_varchar");
		q.addParam(name="edited", value=arguments.faq.edited,cfsqltype="cf_sql_tinyint");
		q.addParam(name="rejected", value=arguments.faq.rejected,cfsqltype="cf_sql_tinyint");
		q.addParam(name="deleted", value=arguments.faq.deleted,cfsqltype="cf_sql_tinyint");
		q.addParam(name="faq_id", value=arguments.faq.faq_id,cfsqltype="cf_sql_integer");
		q.execute();
	}

}