component {

	url.returnformat="json";

	/*
	Remote proxy to allow for complete/not complete setting of a task. Requires login
	*/
	remote function updateTask(required numeric task, required boolean complete) {
		if(!isDefined("session.auth.isLoggedIn")) {
			return 0;
		} 
		//now proxy to app service, note we don't currently validate user/project/task
		var t = application.taskService.get(arguments.task);
		if(t.task_id == "") {
			return 0;
		}
		t.completed = arguments.complete;
		application.taskService.markComplete(t.task_id, session.auth.user_id);
		return 1;
	}

}