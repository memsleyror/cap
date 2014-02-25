component {

	public function getUser(required userid) {
		var q = new com.adobe.coldfusion.query();
		//ToDo: Don't select *
		q.setSQL("select * from users where user_id = :uid");
		q.addParam(name="uid", value=arguments.userid);
		var qResult = q.execute().getResult();
		var result = {};
		var colList = qResult.columnList;
		for(var x=1; x<=listLen(colList); x++) {
			var col = listGetAt(colList, x);
			result[col] = qResult[col][1];
		}

		return result;
	}

	public function getUsersForRole(required roleid) {
		var q = new com.adobe.coldfusion.query();
		q.setSQL("select user_id from users where role_id = :rid");
		q.addParam(name="rid", value=arguments.roleid);
		return q.execute().getResult();
	}

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