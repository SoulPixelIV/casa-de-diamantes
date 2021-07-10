if (open)
{
	if (distance_to_object(player_obj) > 64)
	{
		sprite_index = lasergate_spr;
		if (!spawnedLight)
		{
			lightRed = instance_create_layer(x, y + 40, "GraphicsLayer", spotlightRed_obj);
			spawnedLight = true;
		}
		if (!createdHitbox)
		{
			collider = instance_create_layer(x - 8, y, "TileCollider", colliderAlwaysOn_obj);
			collider.image_yscale = 2.5;
			collider.image_xscale = 0.5;
			createdHitbox = true;
		}
		if (!spawnedPart)
		{
			sparkEmitter = part_emitter_create(global.partSystem);
			part_emitter_region(global.partSystem, sparkEmitter, x - 4, x + 4, y + 80, y + 78, ps_shape_ellipse, ps_distr_gaussian);

			part_emitter_stream(global.partSystem, sparkEmitter, global.lasergatePart, -5);
			spawnedPart = true;
		}
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
	if (createdHitbox)
	{
		if (instance_exists(collider))
		{
			instance_destroy(collider);
			createdHitbox = false;
		}
	}
	part_emitter_destroy(global.partSystem, sparkEmitter);
	spawnedPart = false;
}
