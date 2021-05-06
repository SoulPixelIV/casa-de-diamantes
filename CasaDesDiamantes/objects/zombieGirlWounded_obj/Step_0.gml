/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;
dirLookat = point_direction(x, y, player_obj.x, player_obj.y);

//Sight Check
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

if (deaggroTimer < 0)
{
	aggro = false;
	deaggroTimer = deaggroTimerSave;
}
if (aggroTimer < 0)
{
	aggro = true;
	aggroTimer = aggroTimerSave;
}

if (movement)
{
	if (aggro)
	{
		if (distance_to_object(player_obj) > 24)
		{
			if (instance_exists(hazard_obj))
			{
				if (!collision_circle(x, y, 64, hazard_obj, false, true))
				{
					if (player_obj.x > x)
					{
						horspeed = movSpeed;
					}
					else
					{
						horspeed = -movSpeed;
					}
				}
				else
				{
					hazard = instance_nearest(x, y, hazard_obj);
					if (hazard.x > x)
					{
						horspeed = -movSpeed / 2;
					}
					else
					{
						horspeed = movSpeed / 2;
					}
				}
			}
			else
			{
				if (player_obj.x > x)
				{
					horspeed = movSpeed;
				}
				else
				{
					horspeed = -movSpeed;
				}
			}
			if (dirLookat > 90 && dirLookat < 270)
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = 1;
			}
		}
		else
		{
			horspeed = 0;
		}	
	}
}
else
{
	horspeed = 0;
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
//horspeed
if (!place_free(x + (horspeed * global.dt), y))
{
	if (sign(horspeed) != 0)
	{
		while (place_free(x + sign(horspeed) / 100, y))
		{
			x += sign(horspeed) / 100;
		}
		horspeed = 0;
	}
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
if (hp < 0)
{
	var deathCross = instance_create_layer(x, y - 8, "ForegroundObjects", deathCross_obj);
	with (headshotHitbox)
	{
		instance_destroy();
	}
	
	//Enemy Slowmo
	var randNum = choose(1,2,3,4,5,6,7,8,9);
	if (randNum == 9)
	{
		player_obj.enemySlowmo = true;
		camera_obj.follow = deathCross;
	}
	
	//Drop Item
	if (instance_exists(player_obj))
	{
		if (player_obj.hp < 30)
		{
			var randDrop = choose(1,1,1,1,1,1,1,1,1,2)
			if (randDrop == 2)
			{
				instance_create_layer(x, y - 16, "Instances", healthpackPickup_obj);
			}
		}
	}
	
	//Drop Ammo
	if (lastBullet == bulletDualBarettas_obj)
	{
		repeat (ceil(ammoSpawnCount / 3))
		{
			instance_create_layer(x, y, "Instances", ammoShotgunSmall_obj);
		}
	}
	if (lastBullet == bulletShotgun_obj)
	{
		repeat (ammoSpawnCount)
		{
			instance_create_layer(x, y, "Instances", ammoPistolSmall_obj);
		}
	}

	//Drop Money
	var maxAmount = random_range(moneyDropMin, moneyDropMax);
	for (i = 0; i < maxAmount; i++)
	{
		chip = 1;
		
		if (chip == 1)
		{
			instance_create_layer(x, y - 16, "Instances", chipBluePickup_obj);
		}
	}
	
	damageTint = false;
	damageTintHeadshot = false;
	instance_change(zombieGirlWoundedDeath1_obj, false);
}

//Headshot Hitbox
with (headshotHitbox)
{
	x = body.x;
	y = body.y - 16;
}

if (damageTint && sprite_index != zombieGirlWoundedFlashHeadshot_spr)
{
	sprite_index = zombieGirlWoundedFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTintHeadshot && sprite_index != zombieGirlWoundedFlash_spr)
{
	sprite_index = zombieGirlWoundedFlashHeadshot_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	sprite_index = zombieGirlWounded_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
	damageTintHeadshot = false;
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