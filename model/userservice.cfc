component {



	//Utility func to return the profile url (or default)
	//TODO: Add some simple RAM-based caching to this
	public function getProfilePic(required userid) {
		var q = new com.adobe.coldfusion.query();
		q.setSQL("select image_file from users where user_id = :uid");
		q.addParam(name="uid", value=arguments.userid);
		var results = q.execute().getResult();
		if(results.recordCount is 1 && results.image_file[1] != "") {
			return "images/profiles/" & results.image_file[1];
		} else {
			return "assets/avatars/avatar2.png";
		}
	}

}