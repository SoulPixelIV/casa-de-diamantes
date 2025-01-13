//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//movSpeed -= global.dt / 100;

x += (lengthdir_x(movSpeed, dir)) * global.dt;
y += (lengthdir_y(movSpeed, dir)) * global.dt;

if (phase == 0) {
	if (image_alpha < 1) {
		image_alpha += global.dt / 20;
		image_xscale += global.dt / 20;
		image_yscale += global.dt / 20;
	} else {
		phase = 1;
	}
} else {
	if (image_alpha > 0) {
		image_alpha -= global.dt / 130;
		image_xscale -= global.dt / 130;
		image_yscale -= global.dt / 130;
		movSpeed -= global.dt / 130;
	} else {
		instance_destroy();
	}
}

lifetime -= global.dt / 4;
if (lifetime < 0)
{
	instance_destroy();
}