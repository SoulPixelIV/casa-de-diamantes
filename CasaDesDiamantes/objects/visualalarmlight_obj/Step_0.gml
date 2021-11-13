if (instance_exists(alarmLamp_obj)) {
	with (alarmLamp_obj) {
		if (open) {
			camera_obj.visualalarmlight = true;
		} else {
			camera_obj.visualalarmlight = false;
		}
	}
}