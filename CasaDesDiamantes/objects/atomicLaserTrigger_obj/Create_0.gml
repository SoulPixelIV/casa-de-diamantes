playedSound = false;
screenShakeDone = false;
chromaticDone = false;
screenShakeTimer = 900;
magnitudeIncrease = 0;

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
