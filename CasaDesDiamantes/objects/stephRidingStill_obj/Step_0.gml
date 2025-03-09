//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!checkedPlayer) {
	if (instance_exists(player_obj)) {
		if (distance_to_object(player_obj) < 1200) {
			camera_obj.cameraTrainCutscene = true;
			firstCutscene = true;
			checkedPlayer = true;
		}
	}
}

if (firstCutscene) {
	//Cutscene Movement
	x += global.dt * movSpeed;

	if (!ridingCutscene) {
		if (movSpeed > 0) {
			movSpeed -= global.dt / 150;
			if (movSpeed < 0) {
				movSpeed = 0;
				player_obj.x = x;
				player_obj.y = y;
				player_obj.movement = true;
				player_obj.invincible = false;
				player_obj.shootingAllowed = true;
				camera_obj.cameraTrainCutscene = false;
				camera_obj.cameraTargetTimer = -1;
				instance_destroy();
			}
		}
	}
}