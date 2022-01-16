/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;
dirLookat = point_direction(x, y, player_obj.x, player_obj.y);

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = explosiveMerchant_obj;
	spawn.dir = image_xscale;
	gotSpawned = true;
}

//Sight Check
if (instance_exists(player_obj)) {
	if (!collision_line(x, y, player_obj.x, player_obj.y, collider_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, enemyVisionBlockZone_obj, false, true))
	{
		if (collision_line(x, y, player_obj.x, player_obj.y, player_obj, false, true))
		{
			if (distance_to_point(player_obj.x, player_obj.y) < aggroRange)
			{
				if ((image_xscale == 1 && player_obj.x >= x) || (image_xscale == -1 && player_obj.x <= x))
				{
					deaggroTimer = deaggroTimerSave;
					aggroTimer -= global.dt;
				}
			}
		}
	}
	else
	{
		aggroTimer = aggroTimerSave;
		deaggroTimer -= global.dt;
	}
}

if (deaggroTimer < 0)
{
	if (!place_meeting(x, y, battleArena_obj) && room != infiniteSpawn) {
		aggro = false;
		deaggroTimer = deaggroTimerSave;
	}
}
if (aggroTimer < 0)
{
	aggro = true;
	aggroTimer = aggroTimerSave;
}

if (movement && aggro && !flying)
{
	if (dir == 0)
	{
		horspeed = movSpeed;
		image_xscale = 1;
	}
	else
	{
		horspeed = -movSpeed;
		image_xscale = -1;
	}
}

//Gravity
if (verspeed < 2 && !flying)
{
	verspeed -= gravityStrength * global.dt;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//Collision
//horspeed
if (!place_free(x + (horspeed * global.dt), y))
{
	if (sign(horspeed) != 0)
	{
		while (place_free(x + sign(horspeed) / 100, y))
		{
			x += sign(horspeed) / 100;
		}
		
		if (!flying)
		{
			horspeed = 0;
		
			if (dir == 0)
			{
				dir = 1;
			}
			else
			{
				dir = 0;
			}
		}
		else
		{
			exploding = true;
		}
	}
} 

if (flying && place_meeting(x, y, enemy_obj))
{
	exploding = true;
}

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
	}
}

//Player Collision
if (place_meeting(x + horspeed * global.dt, y, player_obj))
{
	if (player_obj.x > x)
	{
		horspeed = -movSpeed;
	}
	else
	{
		horspeed = movSpeed;
	}
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

//###Death###
if (hp <= 0)
{
	sprite_index = explosiveMerchantFlying_spr;
	animationSpeed = 1.75;
	if (!flying)
	{
		if (instance_exists(player_obj) && !checkedPlayer)
		{
			if (player_obj.x > x)
			{
				flyDir = 1;
			}
			else
			{
				flyDir = -1;
			}
			checkedPlayer = true;
		}
		
		if (flyDir == 1)
		{
			image_xscale = 1;
			horspeed = -2.8;
		}
		else
		{
			image_xscale = -1;
			horspeed = 2.8;
		}
		flying = true;
	}
	
	if (exploding)
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
						instance_create_layer(x, y - 16, "Instances", healthSmall_obj);
					}
				}
				else
				{
					repeat (4)
					{
						instance_create_layer(x, y - 16, "Instances", healthSmall_obj);
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
				instance_create_layer(x, y - 16, "Instances", chipBluePickup_obj);
			}
			if (chip == 2)
			{
				instance_create_layer(x, y - 16, "Instances", chipRedPickup_obj);
			}
		}
		
		//Set Points
	if (global.multiplier < 8) {
		global.multiplier = global.multiplier * 2;
	}
	global.multiplierTimer = global.multiplierTimerSave;
	global.scorepoints += points * global.multiplier;
	
		damageTint = false;
		if (headshot)
		{
			instance_change(zombieGirlDeath1_obj, true);
		}
		else
		{
			instance_change(zombieGirlDeath2_obj, true);
		}
		instance_destroy(alarmLight);
		instance_create_layer(x, y, "Instances", explosionBigOnlyEnemy_obj);
		instance_destroy();
	}
}

//Alarm Light
with (alarmLight)
{
	light[| eLight.X] = body.x;
	light[| eLight.Y] = body.y;
}

if (damageTint)
{
	sprite_index = zombieGirlFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	sprite_index = explosiveMerchant_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
}

checkPlayerTimer -= global.dt;
if (checkPlayerTimer < 0)
{
	if (instance_exists(camera_obj))
	{
		if (x < (camera_obj.x + (camera_obj.xScreenSize / 2) + 128) && x > (camera_obj.x - (camera_obj.xScreenSize / 2) - 128))
		{
			if (y < (camera_obj.y + (camera_obj.yScreenSize / 2) + 128) && y > (camera_obj.y - (camera_obj.yScreenSize / 2) - 128))
			{
				gravityStrength = gravityStrengthSave;
			}
			else
			{
				gravityStrength = 0;
			}
		}
		else
		{
			gravityStrength = 0;
		}
	}
	else
	{
		gravityStrength = 0;
	}
	checkPlayerTimer = checkPlayerTimerSave;
}