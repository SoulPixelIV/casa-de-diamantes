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
	}
	if (spawnElement2 != noone)
	{
		repeat(spawnNumber2)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement2);
		}
	}
	if (spawnElement3 != noone)
	{
		repeat(spawnNumber3)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement3);
		}
	}
	if (spawnElement4 != noone)
	{
		repeat(spawnNumber4)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement4);
		}
	}
	if (spawnElement5 != noone)
	{
		repeat(spawnNumber5)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement5);
		}
	}
	spawned = true;
}

