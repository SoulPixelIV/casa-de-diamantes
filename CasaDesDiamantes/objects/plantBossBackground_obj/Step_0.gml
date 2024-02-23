if (moveToSecondFloor) {
	if (!place_meeting(x, y, plantBossMoveCollider_obj)) {
		y += global.dt;
	}
}

//Scale Manipulation
if (scaleDir == 0) {
	if (image_xscale < 1.07) {
		image_xscale += global.dt / 2500;
	} else {
		scaleDir = 1;
	}
}

if (scaleDir == 1) {
	if (image_xscale > 0.93) {
		image_xscale -= global.dt / 2500;
	} else {
		scaleDir = 0;
	}
}

//Rotation Manipulation
if (rotateDir == 0) {
	if (image_angle > -7) {
		image_angle -= global.dt / 75;
	} else {
		rotateDir = 1;
	}
}

if (rotateDir == 1) {
	if (image_angle < 7) {
		image_angle += global.dt / 75;
	} else {
		rotateDir = 0;
	}
}