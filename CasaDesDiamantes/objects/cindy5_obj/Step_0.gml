//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (global.storyAct != 1) {
	instance_destroy();
}

if (!global.firstmeetingDialogue) {
	instance_destroy();
}

if (!global.dinnerDialogue) {
	instance_destroy();
}
