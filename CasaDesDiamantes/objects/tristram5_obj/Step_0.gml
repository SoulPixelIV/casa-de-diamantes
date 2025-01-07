//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (global.storyAct != 2) {
	instance_destroy();
}
