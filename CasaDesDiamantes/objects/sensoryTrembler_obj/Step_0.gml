/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

if (instance_exists(player_obj))
{
	dirLookat = point_direction(x, y, player_obj.x, player_obj.y);
}
else
{
	dirLookat = 0;
}

//Sight Check
if (!collision_line(x, y, player_obj.x, player_obj.y, collider_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, enemyVisionBlockZone_obj, false, true))
{
	if (collision_line(x, y, player_obj.x, player_obj.y, player_obj, false, true))
	{
		if (distance_to_point(player_obj.x, player_obj.y) < aggroRange)
		{
			aggroTimer -= global.dt;
		}
	}
}
else
{
	aggroTimer = aggroTimerSave;
}

//Base Rotation
if (baseRotation > 0.5)
{
	rotDir = 1;
}
if (baseRotation < -0.5)
{
	rotDir = 0;
}
if (rotDir == 0)
{
	baseRotation += global.dt / 16;
}
else
{
	baseRotation -= global.dt / 16;
}

if (aggroTimer < 0)
{
	aggro = true;
	aggroTimer = aggroTimerSave;
}

if (movement)
{
	if (aggro && distance_to_object(player_obj) > 300 && distance_to_object(player_obj) < aggroRange)
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
	}
	
	if (distance_to_object(player_obj) < 300 && distance_to_object(player_obj) > 24)
	{
		randDirChangeTimer -= global.dt;
		if (randDirChangeTimer < 0)
		{
			randMovDir = choose(1, -1);
			randDirChangeTimer = randDirChangeTimerSave + random_range(-80, 80);
		}
		horspeed = movSpeed * randMovDir;
	}
	
	if (distance_to_object(player_obj) < 24)
	{
		horspeed = 0;
	}
}
else
{
	if (!attackInProg)
	{
		horspeed = 0;
	}
}

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt;
}
if (attackInProg)
{
	verspeed = 0;
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
if (!place_free(x, (y + (verspeed * global.dt))) + 76)
{
	if (sign(verspeed) != 0)
	{
		while (place_free(x, (y + sign(verspeed) / 100) + 64))
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
if (hp < 0)
{
	var deathCross = instance_create_layer(x, y - 8, "ForegroundObjects", deathCross_obj);
	
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
		repeat (ceil(ammoSpawnCount / 4))
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
		chip = choose(1,1,1,1,2)
		
		if (chip == 1)
		{
			instance_create_layer(x, y - 16, "Instances", chipBluePickup_obj);
		}
		if (chip == 2)
		{
			instance_create_layer(x, y - 16, "Instances", chipRedPickup_obj);
		}
	}
	damageTint = false;
	damageTintHeadshot = false;
	if (headshot)
	{
		instance_change(zombieGirlDeath1_obj, true);
	}
	else
	{
		instance_change(zombieGirlDeath2_obj, true);
	}
}

//###Attack###

//Cooldown
if (!attackInProg && !attackInProg2 && aggro)
{
	if (distance_to_object(player_obj) < aggroRange && distance_to_object(player_obj) > 86)
	{
		attackCooldown -= global.dt;
	}
	if (distance_to_object(player_obj) < 86 && distance_to_object(player_obj) > 32)
	{
		attackInProg2 = true;
	}
	if (distance_to_object(player_obj) < 32)
	{
		attackInProg3 = true;
	}
}

if (attackCooldown < 0 && !attackInProg && !attackInProg2 && !attackInProg3)
{
	if (distance_to_object(player_obj) < aggroRange && distance_to_object(player_obj) > 86)
	{
		attackInProg = true;
	}
	if (distance_to_object(player_obj) < 86 && distance_to_object(player_obj) > 32)
	{
		attackInProg2 = true;
	}
	if (distance_to_object(player_obj) < 32)
	{
		attackInProg3 = true;
	}
}

//Start Attack 1
if (attackInProg)
{
	repeat (8)
	{
		instance_create_layer(player_obj.x + random_range(-76, 76), player_obj.y + 26, "Instances", targetCircle_obj);
	}
	instance_create_layer(x - 16, y - 168, "ForegroundObjects", shotLightShotgun_obj);
	instance_create_layer(x - 16, y - 168, "ForegroundObjects", smokecloud_obj);
	screenshake(50, 12, 0.6, id);
	attackCooldown = attackCooldownSave;
	attackInProg = false;
	delay = true;
}

//Start Attack 2
if (attackInProg2)
{
	initialShootDelay -= global.dt;
	if (initialShootDelay < 0)
	{
		if (distance_to_object(player_obj) > 32)
		{
			shootDelay -= global.dt;
			if (shootDelay < 0)
			{
				bullet1 = instance_create_layer(x - 52 + random_range(-1, 1), y - 79, "Instances", bulletSensoryTrembler_obj);
				bullet2 = instance_create_layer(x + 52 + random_range(-1, 1), y - 79, "Instances", bulletSensoryTrembler_obj);
				bullet1.dir = 200;
				bullet1.dirChange = true;
				bullet2.dir = 330;
				bullet2.dirChange = true;
				shootDelay = 5;
			}
		}
		attackCooldown = attackCooldownSave;
		delay = true;
	}
}

//Start Attack 3
if (attackInProg3)
{
	smokeDelay -= global.dt;
	if (smokeDelay < 0)
	{
		instance_create_layer(x - 50 + random_range(-1, 1), y - 136, "ForegroundObjects", dustParticle_obj);
		instance_create_layer(x + 57 + random_range(-1, 1), y - 136, "ForegroundObjects", dustParticle_obj);
		smokeDelay = 4;
	}
	attackCooldown = attackCooldownSave;
	delay = true;
}
	
if (delay)
{
	attackDelay -= global.dt;
}
if (attackDelay < 0)
{
	delay = false;
	attackDelay = attackDelaySave;
	attackInProg = false;
	attackInProg2 = false;
	attackInProg3 = false;
	initialShootDelay = initialShootDelaySave;
}

if (damageTint && sprite_index != zombieGirlFlashHeadshot_spr)
{
	//sprite_index = zombieGirlFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTintHeadshot && sprite_index != zombieGirlFlash_spr)
{
	//sprite_index = zombieGirlFlashHeadshot_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	//sprite_index = zombieGirl_spr;
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

//Set hitbox coordinates
//if (instance_exists(colHitbox))
//{
	//colHitbox.x = x - 48;
	//colHitbox.y = y - 126;
//}