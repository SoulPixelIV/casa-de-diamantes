spawnTimer -= global.dt;

if (spawnTimer < 0)
{
	instance_create_layer(x, y, "Lightning", lightning_obj);
	spawnTimer = random_range(300, 1000);
}
