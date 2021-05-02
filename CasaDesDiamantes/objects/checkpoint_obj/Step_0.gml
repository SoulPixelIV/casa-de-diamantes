//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//Activate Checkpoint
if (distance_to_object(player_obj) < 32 && player_obj.key_up_pressed && !used)
{
	active = true;
}

if (distance_to_object(player_obj) < 32)
{
	player_obj.lastCheckpoint = id;
}

//Drop Reward
if (active)
{	
	item = choose(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,5);
	
	if (item == 1 || item == 5)
	{
		var maxAmount = random_range(moneyDropMin, moneyDropMax);
		for (i = 0; i < maxAmount; i++)
		{
			chip = choose(1,1,1,1,1,2,2,2,3)
		
			if (chip == 1)
			{
				instance_create_layer(x, y - 64, "Instances", chipBluePickup_obj);
			}
			if (chip == 2)
			{
				instance_create_layer(x, y - 64, "Instances", chipRedPickup_obj);
			}
			if (chip == 3)
			{
				instance_create_layer(x, y - 64, "Instances", chipVioletPickup_obj);
			}
		}
	}
	if (item == 2 || item == 5)
	{
		var maxAmount = random_range(1, 4);
		for (i = 0; i < maxAmount; i++)
		{
			ammo = choose(1,1,1,1,1,2,2)
		
			if (ammo == 1)
			{
				instance_create_layer(x, y - 64, "Instances", ammoPackPistolDrop_obj);
			}
			if (ammo == 2)
			{
				instance_create_layer(x, y - 64, "Instances", ammoPackShotgunDrop_obj);
			}
		}
	}
	if (item == 3 || item == 5)
	{
		var maxAmount = random_range(1, 4);
		for (i = 0; i < maxAmount; i++)
		{
			instance_create_layer(x, y - 64, "Instances", healthpackDrop_obj);
		}
	}
	if (item == 4)
	{
		instance_create_layer(x, y - 64, "Instances", syringeDrop_obj);
	}
	
	player_obj.plagueTransformation = false;
	player_obj.infection = 30;
	camera_obj.zombiespikeEffectBorder = camera_obj.zombiespikeEffectBorderSave;
	camera_obj.zombiespikeBorderTransparent = camera_obj.zombiespikeBorderTransparentSave;
	camera_obj.showedInf = false;
	camera_obj.showInfOverlay = false;
	camera_obj.InfOverlayTimer = camera_obj.InfOverlayTimerSave;
	camera_obj.infOverlayX = camera_obj.xScreenSize;
	camera_obj.infOverlayY = 0;
	camera_obj.infOverlayLocked = false;

	active = false;
	used = true;
}