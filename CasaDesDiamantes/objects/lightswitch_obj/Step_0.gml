if (open) {
	image_index = 0;
	lightTimer -= global.dt / 4;
	
	if (lightTimer > 600) {
		with (light) {
			light[| eLight.Intensity] = 2;
		}
	} else if (lightTimer > 450) {
		with (light) {
			light[| eLight.Intensity] = 1.5;
		}
	} else if (lightTimer > 300) {
		with (light) {
			light[| eLight.Intensity] = 1;
		}
	} else if (lightTimer > 150) {
		with (light) {
			light[| eLight.Intensity] = 0.5;
		}
	} else if (lightTimer < 0) {
		open = false;
	}
} else {
	image_index = 1;
	lightTimer = lightTimerSave;
	with (light) {
		light[| eLight.Intensity] = 0;
	}
}

if (place_meeting(x, y, bullet_obj)) {
	open = true;
	lightTimer = lightTimerSave;
}