component {

	public function getFAQs() {
		return "";
	}

	public void function addQuestion(required question, required projectidfk, required useridfk) {
		var q = new com.adobe.coldfusion.query();
		q.setSQL("insert into faq(question,projectidfk,datecreated,user_id) values(:question,:pid,:created,:userid)");
		q.addParam(name="question", value=arguments.question,cfsqltype="cf_sql_varchar");
		q.addParam(name="pid", value=arguments.projectidfk,cfsqltype="cf_sql_integer");
		q.addParam(name="created", value=now(),cfsqltype="cf_sql_timestamp");
		q.addParam(name="userid", value=arguments.useridfk,cfsqltype="cf_sql_integer");
		q.execute();

	}

	public struct function getFaq(required faqidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select faq_id, question, answer, rejected, deleted, edited, projectidfk, datecreated, user_id from faq where faq_id = :fid");
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

	//TODO: Add user columns here too
	public query function getQuestions(required projectidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select faq_id, question, answer, rejected, deleted, edited, datecreated, user_id from faq where projectidfk = :pid order by datecreated desc");
		q.addParam(name="pid", value=arguments.projectidfk);
		var results = q.execute().getResult();
		return results;
	}

	public query function getAnsweredQuestions(required projectidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select f.faq_id, f.question, f.answer, f.datecreated, f.user_id, u.user_firstname, u.user_lastname, u.image_file from faq f, users u where f.answer is not null and (f.deleted is null or f.deleted = 0) and (f.rejected is null or f.rejected = 0) and f.projectidfk = :pid and f.user_id = u.user_id order by f.datecreated desc");
		q.addParam(name="pid", value=arguments.projectidfk);
		var results = q.execute().getResult();
		return results;
	}

	//Possible TODO - edit user?
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