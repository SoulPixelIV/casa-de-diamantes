x += global.dt * hsp;
y += global.dt * vsp;

hsp *= 0.9;
vsp *= 0.9;

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (image_index > image_number - 1)
{
	instance_destroy();
}