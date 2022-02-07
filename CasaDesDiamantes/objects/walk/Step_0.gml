//Animation
image_speed = 0;
image_index += global.dt / 15;

stopTime -= global.dt;

if (place_meeting(x, y, collider_obj) && stopTime < 0) {
	if (dir == 0) {
		dir = 1;
		image_xscale = -1;
		stopTime = 8;
	} else {
		dir = 0;
		image_xscale = 1;
		stopTime = 8;
	}
}

if (dir == 0) {
	x += global.dt * speedX;
} else {
	x -= global.dt * speedX;
}
