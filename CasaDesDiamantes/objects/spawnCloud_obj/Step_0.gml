//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

spawnTime -= global.dt;

if (spawnTime < 0)
{
	instance_create_layer(x, y, "Instances", spawnObject);
	instance_destroy();
}