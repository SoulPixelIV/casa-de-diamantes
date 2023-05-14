//Animation
image_speed = 0;
image_index += (global.dt / 30) * animationSpeed;

lifeTimer -= global.dt;

if (lifeTimer < 0) {
	instance_destroy();
}

x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;