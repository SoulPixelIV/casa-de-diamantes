if (instance_exists(selectedArena)) {
	if (selectedArena.done && !teleported) {
		timer -= global.dt;
	}
}

if (timer < 0) {
	if (instance_exists(player_obj)) {
		player_obj.movement = false;
		with (player_obj) {
			image_alpha = 0;
		}
		teleportTimer -= global.dt;
	}
}

if (teleportTimer < 0) {
	player_obj.x = teleportBoxWarpzone_obj.x;
	player_obj.y = teleportBoxWarpzone_obj.y;
	player_obj.movement = true;
	with (player_obj) {
		image_alpha = 1;
	}
	timer = timerSave;
	teleportTimer = teleportTimerSave;
	teleported = true;
}
