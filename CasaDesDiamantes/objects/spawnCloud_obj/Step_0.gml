//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

spawnTime -= global.dt;

if (spawnTime < 0)
{
	instance_destroy(light);
	var object = instance_create_layer(x, y, "Instances", spawnObject);
	if (object == crawler_obj)
	{
		object.aggro = true;
	}
	with (place_meeting(x, y, battleArena_obj))
	{
		setWave = false;
		countEnemies = true;
	}
	instance_destroy();
}