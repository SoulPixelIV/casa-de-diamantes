spawnTimer -= global.dt;

if (spawnTimer < 0)
{
	instance_create_layer(x, y, "Background2", lightning_obj);
	spawnTimer = random_range(200, 500);
}
