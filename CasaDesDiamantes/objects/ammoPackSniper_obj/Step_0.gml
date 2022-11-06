//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

y += verspeed * global.dt;

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", pickupHiddenSpawnpoint_obj);
	spawn.spawnID = ammoPackSniper_obj;
	gotSpawned = true;
}

//Move towards player
if (distance_to_object(player_obj) < 32)
{
	if (player_obj.x > x)
	{
		horspeed += 0.1;
	}
	else
	{
		horspeed += -0.1;
	}
	
	if (player_obj.y > y)
	{
		verspeed += 0.1;
	}
	else
	{
		verspeed += -0.1;
	}
}

//Movement
if (dir == 0)
{
	verspeed = speedVer;
	if (movTimer < 0)
	{
		dir = 1;
		movTimer = movTimerSave;
	}
}
else
{
	verspeed = -speedVer;
	if (movTimer < 0)
	{
		dir = 0;
		movTimer = movTimerSave;
	}
}

movTimer -= global.dt;