component {

	/*
	Currently used for project feeds - will change a date from today to Today, 
	ditto for Yesterday, Tomorrow, the rest though will be MM/DD/YYYY
	*/
	public string function niceDate(s) {
		var today = now();
		var tomorrow = dateAdd("d", 1, today);
		var yesterday = dateAdd("d", -1, today);
		if(dateCompare(s, today, "d") == 0) return "Today";
		if(dateCompare(s, tomorrow, "d") == 0) return "Tomorrow";
		if(dateCompare(s, yesterday, "d") == 0) return "Yesterday";
		return dateFormat(s, "mm/dd/yyyy");
	}
	
}