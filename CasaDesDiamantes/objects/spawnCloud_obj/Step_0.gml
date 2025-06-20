//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

image_alpha += global.dt / 100;

spawnTime -= global.dt;

if (spawnTime < 0)
{
	instance_destroy(light);
	var object = instance_create_layer(x, y, "Instances", spawnObject);
	object.gotSpawned = true;
	if (instance_exists(battleArenaSpawn_obj))
	{
		object.image_xscale = instance_nearest(x, y, battleArenaSpawn_obj).dir;
		if (instance_nearest(x, y, battleArenaSpawn_obj).callSpiders) {
			if (spawnObject == spidercorpse_obj) {
				object.callSpiders = true;
				object.callSpidersRange = instance_nearest(x, y, battleArenaSpawn_obj).callSpidersRange;
			}
		}
	}
	
	with (object)
	{
		if (instance_exists(battleArenaSpawn_obj))
		{
			if (instance_nearest(x, y, battleArenaSpawn_obj).isAggro)
			{
				if (variable_instance_exists(id, "aggro"))
				{
					aggro = true;
				}
			}
		}
	}

	with (place_meeting(x, y, battleArena_obj))
	{
		setWave = false;
		countEnemies = true;
	}
	instance_destroy();
}