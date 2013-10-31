component {

	public function getFAQs() {
		return "";
	}

	public query function getAnsweredQuestions() {

		var q = new com.adobe.coldfusion.query();
		q.setSQL("select question, answer from faq where answer is not null and deleted is null and rejected is null");
		var results = q.execute().getResult();
		return results;
	}

}