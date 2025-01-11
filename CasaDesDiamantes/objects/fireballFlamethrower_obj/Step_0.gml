//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

movSpeed -= global.dt / 100;

x += (lengthdir_x(movSpeed, dir)) * global.dt;
y += (lengthdir_y(movSpeed, dir)) * global.dt;

if (image_alpha < 1)
{
	image_alpha += global.dt / 500;
	image_xscale += global.dt / 500;
	image_yscale += global.dt / 500;
}

lifetime -= global.dt / 4;
if (lifetime < 0)
{
	instance_destroy();
}