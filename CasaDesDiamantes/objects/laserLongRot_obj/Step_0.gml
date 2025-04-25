//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (movement == 1) {
	x -= global.dt;
}
if (movement == 2) {
	x += global.dt;
}