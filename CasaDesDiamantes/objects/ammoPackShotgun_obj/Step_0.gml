//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", pickupHiddenSpawnpoint_obj);
	spawn.spawnID = ammoPackShotgun_obj;
	gotSpawned = true;
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

x += horspeed * global.dt;
y += verspeed * global.dt;