//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//Cutscene Movement
if (movement) {
	x += global.dt * movSpeed;
}

if (!ridingCutscene) {
	if (movSpeed > 0) {
		movSpeed -= global.dt / 150;
		if (movSpeed < 0) {
			movSpeed = 0;
		}
	}
}
