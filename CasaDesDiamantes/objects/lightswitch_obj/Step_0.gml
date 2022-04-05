if (open) {
	lightTimer -= global.dt / 4;
	
	if (lightTimer > 600) {
		image_index = 0;
		with (light) {
			light[| eLight.Intensity] = 2;
		}
	} else if (lightTimer > 450) {
		image_index = 1;
		with (light) {
			light[| eLight.Intensity] = 1.5;
		}
	} else if (lightTimer > 300) {
		image_index = 2;
		with (light) {
			light[| eLight.Intensity] = 1;
		}
	} else if (lightTimer > 150) {
		image_index = 3;
		with (light) {
			light[| eLight.Intensity] = 0.5;
		}
	} else if (lightTimer < 150 && lightTimer > 0) {
		image_index = 4;
	} else if (lightTimer < 0) {
		open = false;
	}
} else {
	image_index = 5;
	lightTimer = lightTimerSave;
	with (light) {
		light[| eLight.Intensity] = 0.1;
	}
}

if (place_meeting(x, y, bullet_obj)) {
	open = true;
	lightTimer = lightTimerSave;
}