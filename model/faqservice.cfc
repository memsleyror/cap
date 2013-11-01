component {

	public function getFAQs() {
		return "";
	}

	public query function getAnsweredQuestions(required projectidfk) {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select question, answer from faq where answer is not null and deleted is null and rejected is null and projectidfk = :pid");
		q.addParam(name="pid", value=arguments.projectidfk);
		var results = q.execute().getResult();
		return results;
	}

}