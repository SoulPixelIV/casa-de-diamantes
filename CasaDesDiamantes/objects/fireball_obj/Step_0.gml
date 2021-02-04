//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

lifetime -= global.dt / 4;
if (lifetime < 0)
{
	body.fireballInstance = noone;
	instance_destroy(light);
	instance_destroy();
}

spawnTime -= global.dt / 4;
if (spawnTime < 0)
{
	instance_create_layer(x, y, "Instances", fireballSmall_obj);
	spawnTime = spawnTimeSave + random_range(-10, 10);
}