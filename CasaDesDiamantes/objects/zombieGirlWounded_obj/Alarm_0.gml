var sparkle = choose(0,1);

if (sparkle == 0)
{
	instance_create_layer(random_range(x - 8, x + 8), random_range(y - 8, y + 8), "GraphicsLayer", redSparkle_obj);
}
else
{
	instance_create_layer(random_range(x - 8, x + 8), random_range(y - 8, y + 8), "GraphicsLayer", blueSparkle_obj);
}

alarm[0] = spawnDelay + random_range(-12, 12);
