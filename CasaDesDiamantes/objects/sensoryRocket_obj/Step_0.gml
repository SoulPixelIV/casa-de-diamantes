//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

y += global.dt;

if (!place_free(x, y))
{
	instance_change(explosionTiny_obj, true);
}
