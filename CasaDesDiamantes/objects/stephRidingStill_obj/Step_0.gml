//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

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
			camera_obj.cameraTrainCutscene = false;
			camera_obj.cameraTargetTimer = -1;
			instance_destroy();
		}
	}
}