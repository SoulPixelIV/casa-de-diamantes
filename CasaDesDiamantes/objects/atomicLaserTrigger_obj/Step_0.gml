if (playedSound && !screenShakeDone) {
	screenShakeTimer -= global.dt;
	global.chromaticLevel += global.dt / 120;
	magnitudeIncrease += global.dt / 70;
	screenshake(50, 12 + magnitudeIncrease, 0.6, id);
	
	if (screenShakeTimer < 0) {
		screenShakeDone = true;
	}
}

if (global.chromaticLevel > 0 && !chromaticDone && screenShakeTimer < 0) {
	global.chromaticLevel -= global.dt / 75;
	if (global.chromaticLevel < 0.1) {
		chromaticDone = true;
		global.chromaticLevel = 0;
		if (instance_exists(powerplantBackground_obj)) {
			powerplantBackground_obj.laserOn = false;
		}
		if (instance_exists(laserWhitescreen_obj)) {
			laserWhitescreen_obj.laserOn = false;
		}
		
		switch (index) {
			case 0:
				global.laserShot0 = true;
			break;
			case 1:
				global.laserShot1 = true;
			break;
			case 2:
				global.laserShot2 = true;
			break;
			case 3:
				global.laserShot3 = true;
			break;
			case 4:
				global.laserShot4 = true;
			break;
			case 5:
				global.laserShot5 = true;
			break;
		}
	}
}

//Check if Laser Index already Done
switch (index) {
	case 0:
		if (global.laserShot0) {
			playedSound = true;
			screenShakeDone = true;
		}
	break;
	case 1:
		if (global.laserShot1) {
			playedSound = true;
			screenShakeDone = true;
		}
	break;
	case 2:
		if (global.laserShot2) {
			playedSound = true;
			screenShakeDone = true;
		}
	break;
	case 3:
		if (global.laserShot3) {
			playedSound = true;
			screenShakeDone = true;
		}
	break;
	case 4:
		if (global.laserShot4) {
			playedSound = true;
			screenShakeDone = true;
		}
	break;
	case 5:
		if (global.laserShot5) {
			playedSound = true;
			screenShakeDone = true;
		}
	break;
}
