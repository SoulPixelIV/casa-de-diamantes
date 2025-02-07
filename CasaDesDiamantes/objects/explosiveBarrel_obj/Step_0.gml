if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.spawnID = explosiveMerchantDead_obj;
	spawn.dir = image_xscale;
	gotSpawned = true;
}

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt;
}

//Move Left
if (flyToLeft && !global.pause) {
	x -= 0.75 * global.dt;
	lifeTimer -= global.dt;
	if (lifeTimer < 0) {
		instance_destroy();
	}
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//Collision
if (open || (!open && firstFall))
{
	//verspeed
	if (!place_free(x, y + (verspeed * global.dt)))
	{
		if (sign(verspeed) != 0)
		{
			while (place_free(x, y + sign(verspeed) / 100))
			{
				y += sign(verspeed) / 100;
			}
			verspeed = 0;
			if (explodeOnContact)
			{
				hp = 0;
			}
		}
		firstFall = false;
	}

	//###OutsideSolid###
	if (place_free(x, y))
	{
	    savePosX = x;
	    savePosY = y;
	}
	else
	{
	    x = savePosX;
	    y = savePosY;
	    verSpeed = 0;
	}
}

//###Death###
if (hp <= 0)
{	
	//Drop Item
	if (instance_exists(player_obj))
	{
		if (player_obj.hp < 30 || (player_obj.hp - player_obj.infection < 30))
		{
			if (player_obj.hp > 15)
			{
				repeat (2)
				{
					instance_create_layer(x, y, "Instances", healthSmall_obj);
				}
			}
			else
			{
				repeat (4)
				{
					instance_create_layer(x, y, "Instances", healthSmall_obj);
				}
			}
		}
	}
	
	//Drop Ammo
	if (lastBullet == bulletDualBarettas_obj)
	{
		if (global.unlockedWeapon[2])
		{
			repeat (ceil(ammoSpawnCount / 4))
			{
				instance_create_layer(x, y, "Instances", ammoShotgunSmall_obj);
			}
		}
	}
	if (lastBullet == bulletShotgun_obj)
	{
		if (global.unlockedWeapon[1])
		{
			repeat (ammoSpawnCount)
			{
				instance_create_layer(x, y, "Instances", ammoPistolSmall_obj);
			}
		}
	}

	//Drop Money
	var maxAmount = random_range(moneyDropMin, moneyDropMax);
	for (i = 0; i < maxAmount; i++)
	{
		chip = choose(1,1,1,2,2)
		
		if (chip == 1)
		{
			instance_create_layer(x, y, "Instances", chipBluePickup_obj);
		}
		if (chip == 2)
		{
			instance_create_layer(x, y, "Instances", chipRedPickup_obj);
		}
	}
	
	//Set Points
	if (global.multiplier < 8) {
		global.multiplier = global.multiplier * 2;
	}
	global.multiplierTimer = global.multiplierTimerSave;
	global.scorepoints += points * global.multiplier;
	
	damageTint = false;
	instance_create_layer(x, y, "Instances", explosionBigDelay_obj);
	instance_destroy();
}

if (damageTint)
{
	sprite_index = zombieGirlFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	sprite_index = explosiveMerchantDead_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
}

checkPlayerTimer -= global.dt;
if (checkPlayerTimer < 0)
{
	if (open || (!open && firstFall))
	{
		if (instance_exists(camera_obj))
		{
			if (x < (camera_obj.x + (camera_obj.xScreenSize / 2) + 128) && x > (camera_obj.x - (camera_obj.xScreenSize / 2) - 128))
			{
				if (y < (camera_obj.y + (camera_obj.yScreenSize / 2) + 128) && y > (camera_obj.y - (camera_obj.yScreenSize / 2) - 128))
				{
					gravityStrength = -0.05;
				}
			}
		}
	}
	checkPlayerTimer = checkPlayerTimerSave;
}
if (!firstFall && !open)
{
	gravityStrength = 0;
}

y += verspeed * global.dt;