/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

if (instance_exists(player_obj))
{
	dirLookat = point_direction(x, y, player_obj.x, player_obj.y);
}

if (attackCooldown > 30 && attackInProg1)
{
	playerPosX = player_obj.x;
	playerPosY = player_obj.y;
}

if (movement)
{
	if (distance_to_object(player_obj) < playerSightMax && distance_to_object(player_obj) > playerSightMin)
	{
		if (!collision_circle(x, y, 8, zombieSoldierGirl_obj, false, true))
		{
			if (player_obj.x > x)
			{
				horspeed = movSpeed * 3;
			}
			else
			{
				horspeed = -movSpeed * 3;
			}
		}
		else
		{
			nextEnemy = instance_nearest(x, y, zombieSoldierGirl_obj);
			if (nextEnemy.x > x)
			{
				horspeed = -movSpeed / 2;
			}
			else
			{
				horspeed = movSpeed / 2;
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

//Jetpack
if (dir == 0)
{
	if (verspeed > -0.2)
	{
		verspeed -= global.dt / 800;
	}
	if (verspeed <= -0.2)
	{
		dir = 1;
	}
}
else
{
	if (verspeed < 0.2)
	{
		verspeed += global.dt / 800;
	}
	if (verspeed >= 0.2)
	{
		dir = 0;
	}
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

//Death
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
	
	//Drop Money
	var maxAmount = random_range(moneyDropMin, moneyDropMax);
	for (i = 0; i < maxAmount; i++)
	{
		chip = choose(1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3);
		
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
	damageTint = false;
	damageTintHeadshot = false;
	attackCooldown = attackCooldownSave;
	instance_change(zombieSoldierGirlDeath1_obj, true);
}

//Headshot Hitbox
with (headshotHitbox)
{
	x = body.x;
	y = body.y - 12;
}

//Attack
if (instance_exists(player_obj))
{
	if (player_obj.movement)
	{
		if (distance_to_object(player_obj) < aggroRangeX && player_obj.y > y - 64 && player_obj.y < y + aggroRangeY)
		{
			attackCooldown -= global.dt / 4;
		}
		else
		{
			attackCooldown = attackCooldownSave;
		}
	}
}

if (randAttack == 1)
{
	attackInProg1 = true;
}
else
{
	attackInProg2 = true;
	sprite_index = zombieSoldierGirlGrenate_spr;
}

if (attackCooldown < 160 && attackInProg1)
{
	sprite_index = zombieSoldierGirlAim_spr;
}
if (attackCooldown < 0 && attackInProg1)
{
	var shot = audio_play_sound_on(emitter, shotgunShot_snd, false, 1);
	audio_sound_pitch(shot, random_range(0.9, 1.1));
		
	instance_create_layer(x + 10, y, "Instances", bulletZombieSoldierGirl_obj);
	instance_create_layer(x + 10, y, "Instances", shotLightDualBarettas_obj);	

	attackCooldown = attackCooldownSave;
	sprite_index = zombieSoldierGirl_spr;
	attackInProg1 = false;
	attackInProg2 = false;
	randAttack = choose(1,2);
}
if (attackCooldown < 0 && attackInProg2)
{	
	var grenate = instance_create_layer(x + 10 * image_xscale, y, "Instances", grenate_obj);
	grenate.horspeed = random_range(2, 4) * image_xscale;
	grenate.verspeed = random_range(-4, -6);
	attackCooldown = attackCooldownSave / 2;
	sprite_index = zombieSoldierGirlGrenate_spr;
	attackInProg1 = false;
	attackInProg2 = false;
	randAttack = choose(1,2);
}

if (damageTint && sprite_index != zombieSoldierGirlFlashHeadshot_spr)
{
	sprite_index = zombieSoldierGirlFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTintHeadshot && sprite_index != zombieSoldierGirlFlash_spr)
{
	sprite_index = zombieSoldierGirlFlashHeadshot_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	sprite_index = zombieSoldierGirl_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
	damageTintHeadshot = false;
}
