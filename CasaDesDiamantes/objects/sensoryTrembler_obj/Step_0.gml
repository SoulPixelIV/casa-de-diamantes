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
	if (aggro && distance_to_object(player_obj) > 24)
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
	if (distance_to_object(player_obj) < 66)
	{
		//attackCooldown -= global.dt * 2;
	}
	else if (distance_to_object(player_obj) < aggroRange)
	{
		//attackCooldown -= global.dt;
	}
}

//Prepare Attack
if (attackCooldown < 0 && verspeed == 0)
{
	if (distance_to_object(player_obj) < 66)
	{
		animationSpeed = 1;
		sprite_index = zombieGirlAttack2_spr;
		movement = false;
		attackInProg2 = true;
	}
	else
	{
		if (instance_exists(hazard_obj))
		{
			if (!collision_circle(x, y, 128, hazard_obj, false, true))
			{
				sprite_index = zombieGirlAttack1_spr;
				movement = false;
				attackInProg = true;
			}
		}
	}
	attackCooldown = attackCooldownSave;
}

//Start Attack 1
if (attackInProg)
{
	instance_create_layer(x, y - 4, "ForegroundObjects", dustParticle_obj);
	if (!startDrill)
	{
		var drillSnd = audio_play_sound_on(emitter, drill_snd, false, 1);
		audio_sound_pitch(drillSnd, random_range(0.8, 1));
		startDrill = true;
	}
}
if (attackInProg && image_index > image_number - 1 && !dashed)
{
	animationSpeed = 0;
	damageCollision = true;
	//Front Dash
	if (player_obj.y > y - 32 && player_obj.y < y + 32)
	{
		frontDash_scr(id);
	}
	else
	{
		frontDash_scr(id);
	}
	dashed = true;
}

//Start Attack 2
if (attackInProg2 && image_index > image_number - 1 && !dashed)
{
	animationSpeed = 0;
	dashed = true;
	delay = true;
}	
if (attackInProg2 && image_index > 8 && !spawnedHitbox)
{
	var hitbox = instance_create_layer(x + (16 * image_xscale), y, "Instances", damageHitbox_obj);
	hitbox.image_yscale = 1.5;
	hitbox.image_xscale = 3;
	hitbox.damage = 30;
	hitbox.timer = 140;
	spawnedHitbox = true;
}
	
if (delay)
{
	attackDelay -= global.dt;
}
if (attackDelay < 0)
{
	delay = false;
	attackDelay = attackDelaySave;
	dashed = false;
	attackInProg = false;
	attackInProg2 = false;
	startDrill = false;
	animationSpeed = 0.5;
	sprite_index = zombieGirl_spr;
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
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