//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (used && !spawned)
{
	if (spawnElement1 != noone)
	{
		repeat(spawnNumber1)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement1);
		}
		spawned = true;
	}
}

