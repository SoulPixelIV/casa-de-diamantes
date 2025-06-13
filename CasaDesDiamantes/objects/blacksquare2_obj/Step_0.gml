if (instance_exists(camera_obj)) {
	x = camera_obj.x - global.xScreenSize / 2;
	y = camera_obj.y - global.yScreenSize / 2;
}

if (open) {
	startDelay -= global.dt;
}

if (startDelay < 0) {
	open = false;
	if (image_alpha < 1) {
		image_alpha += global.dt / 1300;
	}
	dialogueDelay -= global.dt;
	
	if (dialogueDelay < 0) {
		if (instance_exists(musicManager_obj)) {
			musicManager_obj.stopMusicForCredits = true;
		}
		creditsDelay -= global.dt;
		
		if (creditsDelay < 0) {
			audio_stop_all();
			room_goto(endcredits);
		}
	}
}
