if (open)
{
	sprite_index = lasergate_spr;
	if (!spawnedLight)
	{
		lightRed = instance_create_layer(x, y, "GraphicsLayer", spotlightRed_obj);
		spawnedLight = true;
	}
}
else
{
	sprite_index = lasergateOff_spr;
	if (spawnedLight)
	{
		instance_destroy(lightRed);
		spawnedLight = false;
	}
}
