/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = zombieBucketGirl_obj;
	spawn.dir = image_xscale;
	gotSpawned = true;
}

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
	if (!attackInProg1)
	{
		horspeed = 0;
	}
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

//Death
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
	
	//Destroy Bucket
	if (instance_exists(bucketHitbox))
	{
		instance_destroy(bucketHitbox);
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
		chip = choose(1,1,1,2,2,2,2,2,2,2,2,3);
		
		if (chip == 1)
		{
			instance_create_layer(x, y - 16, "Instances", chipBluePickup_obj);
		}
		if (chip == 2)
		{
			instance_create_layer(x, y - 16, "Instances", chipRedPickup_obj);
		}
		if (chip == 3)
		{
			instance_create_layer(x, y - 16, "Instances", chipVioletPickup_obj);
		}
	}
	instance_destroy();
}

//Bucket Hitbox
with (bucketHitbox)
{
	if (instance_exists(body))
	{
		if (x != body.x && y != body.y)
		{
			x = body.x;
			y = body.y - 16;
		}
	}
}

//Bucket Destruction
if (hpBucket < 0 && !playedSound)
{
	audio_play_sound(bucketBroken_snd, 1, false);
	playedSound = true;
	bucketRemoved = true;
	sprite_index = zombieBucketGirlBroken_spr;
	with (bucketHitbox)
	{
		instance_destroy();
	}
}

//###Attack###

if (aggro)
{
	attackCooldown -= global.dt;
}

//Cooldown
if (!attackInProg1 && !attackInProg2 && distance_to_object(player_obj) < aggroRange && bucketRemoved && aggro)
{
	movement = true;
	sprite_index = zombieBucketGirlBroken_spr;
}

//Prepare Attack
if (attackCooldown < 0 && distance_to_object(player_obj) < aggroRange)
{
	if (randAttack == 1)
	{
		if (bucketRemoved)
		{
			sprite_index = zombieBucketGirlAttack1Broken_spr;
		}
		else
		{
			sprite_index = zombieBucketGirlAttack1_spr;
		}
		movement = false;
		attackInProg1 = true;
	}
	if (randAttack == 2)
	{
		if (bucketRemoved)
		{
			sprite_index = zombieBucketGirlAttack2Broken_spr;
		}
		else
		{
			sprite_index = zombieBucketGirlAttack2_spr;
		}
		movement = false;
		attackInProg2 = true;
	}
	attackCooldown = attackCooldownSave;
}

//Start Attack 1
if (attackInProg1 && image_index > image_number - 1)
{
	image_index = 0;
	instance_create_layer(x + 10 * image_xscale, y - 10 * image_xscale, "ForegroundObjects", dustParticle_obj);
	repeat(6)
	{
		var grenate = instance_create_layer(x + 10 * image_xscale, y, "Instances", flyingGrenate_obj);
		grenate.horspeed = random_range(1.4, 2.6) * image_xscale;
		grenate.verspeed = random_range(-0.2, -0.8);
	}
	attackInProg1 = false;
	randAttack = choose(1,2);
}

//Start Attack 2
if (attackInProg2 && image_index > image_number - 1)
{
	image_index = 0;
	instance_create_layer(x, y, "ForegroundObjects", forcefield_obj);
	attackInProg2 = false;
	randAttack = choose(1,2);
	movement = true;
	if (bucketRemoved)
	{
		sprite_index = zombieBucketGirlBroken_spr;
	}
	else
	{
		sprite_index = zombieBucketGirl_spr;
	}
}

if (damageTint && bucketRemoved)
{
	sprite_index = zombieBucketGirlFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTint && !bucketRemoved)
{
	sprite_index = zombieBucketGirlFlashBody_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	sprite_index = zombieBucketGirl_spr;
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