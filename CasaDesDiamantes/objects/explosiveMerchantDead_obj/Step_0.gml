/// @description Enemy AI

y += verspeed * global.dt;

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

//Frozen
if (frozen) {
	movSpeed = movSpeedSave / 2;
	image_blend = make_color_rgb(120, 120, 255);
	
	//Icecicle Shot
	if (global.dualBarettasUpgrade2) {
		icecicleAttackTimer -= global.dt;
		if (icecicleAttackTimer < 0) {
			audio_play_sound_on(emitter, icecicleShot_snd, false, false);
			icecicle = instance_create_layer(x, y, "Instances", icecicle_obj);
			icecicle.dir = random_range(0, 359);
			icecicleAttackTimer = 200 + random_range(-30, 30);
		}
	}
} else {
	movSpeed = movSpeedSave;
	image_blend = c_white;
}

if (freezeRes <= 0) {
	frozen = true;
}

//###Death###
if (hp <= 0)
{
	var deathCross = instance_create_layer(x, y - 8, "ForegroundObjects", deathCross_obj);
	
	//Enemy Slowmo
	var randNum = choose(1,2,3,4,5,6,7,8,9);
	if (randNum == 9 || player_obj.forceSlowmo)
	{
		player_obj.enemySlowmo = true;
		player_obj.camFollowTarget = deathCross;
	}
	
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
	if (lastBullet == bulletSilencedMP_obj)
	{
		if (global.unlockedWeapon[4])
		{
			repeat (ceil(ammoSpawnCount / 4))
			{
				instance_create_layer(x, y, "Instances", ammoSniperSmall_obj);
			}
		}
	}
	if (lastBullet == bulletSniper_obj)
	{
		if (global.unlockedWeapon[3])
		{
			repeat (ceil(ammoSpawnCount / 2))
			{
				instance_create_layer(x, y, "Instances", ammoSilencedMPSmall_obj);
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
	instance_destroy(alarmLight);
	instance_create_layer(x, y, "Instances", explosionBig_obj);
	instance_destroy();
}

//Alarm Light
with (alarmLight)
{
	if (instance_exists(body))
	{
		light[| eLight.X] = body.x;
		light[| eLight.Y] = body.y;
	}
}

if (damageTintTimer < 0)
{
	//sprite_index = explosiveMerchantDead_spr;
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