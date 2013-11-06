component {

	public function getFAQs() {
		return "";
	}

	public void function addQuestion(required question, required projectidfk) {
		var q = new com.adobe.coldfusion.query();
		q.setSQL("insert into faq(question,projectidfk) values(:question,:pid)");
		q.addParam(name="question", value=arguments.question,cfsqltype="cf_sql_varchar");
		q.addParam(name="pid", value=arguments.projectidfk,cfsqltype="cf_sql_integer");
		q.execute();

	}

	public struct function getFaq(required faqidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select faq_id, question, answer, rejected, deleted, edited from faq where faq_id = :fid");
		q.addParam(name="fid", value=arguments.faqidfk);
		var results = q.execute().getResult();
		var faqResult = {};
		for(var i=1;i <= listLen(results.columnList); i++) {
			faqResult[listGetAt(results.columnList,i)] = results[listGetAt(results.columnList,i)][1];
		}
		return faqResult;
	}

	public query function getQuestions(required projectidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select faq_id, question, answer, rejected, deleted, edited from faq where projectidfk = :pid");
		q.addParam(name="pid", value=arguments.projectidfk);
		var results = q.execute().getResult();
		return results;
	}

	public query function getAnsweredQuestions(required projectidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select faq_id, question, answer from faq where answer is not null and deleted is null and rejected is null and projectidfk = :pid");
		q.addParam(name="pid", value=arguments.projectidfk);
		var results = q.execute().getResult();
		return results;
	}

}