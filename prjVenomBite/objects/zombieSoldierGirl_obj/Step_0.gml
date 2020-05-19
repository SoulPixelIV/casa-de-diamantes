/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

dirLookat = point_direction(x, y, player_obj.x, player_obj.y);

if (movement)
{
	if (distance_to_object(player_obj) < 64 && distance_to_object(player_obj) > 16)
	{
		if (player_obj.x > x)
		{
			horspeed = -movSpeed;
		}
		else
		{
			horspeed = movSpeed;
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
	instance_create_layer(x, y - 8, "ForegroundObjects", deathCross_obj);
	with (headshotHitbox)
	{
		instance_destroy();
	}
	global.scorepoints += points * global.multiplier;
	global.multiplier += 1;
	global.multiplierTimer = 300;
	gameManager_obj.multiplierRun = true;
	camera_obj.scoreShake = true;
	//camera_obj.vignetteStrength = 3;
	player_obj.enemyFlash = true;

	//Enemy Slowmo
	var randNum = choose(1,2,3,4,5,6,7,8,9);
	if (randNum == 9)
	{
		player_obj.enemySlowmo = true;
		//Camera Bullet Follow
		var cameraTarget = noone;
		if (instance_exists(bulletPistol_obj))
		{
			cameraTarget = instance_nearest(x, y, bulletPistol_obj);
		}
		else if (instance_exists(bulletDualBarettas_obj))
		{
			cameraTarget = instance_nearest(x, y, bulletDualBarettas_obj);
		}
		else if (instance_exists(bulletShotgun_obj))
		{
			cameraTarget = instance_nearest(x, y, bulletShotgun_obj);
		}
		else
		{
			cameraTarget = noone;
		}
		
		if (cameraTarget != noone)
		{
			camera_obj.follow = cameraTarget;
		}
	}
	instance_destroy();
	
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
	}
}

//Headshot Hitbox
with (headshotHitbox)
{
	if (x != body.x && y != body.y)
	{
		x = body.x;
		y = body.y - 16;
		//move_towards_point(body.x, body.y - 16, 3);
	}
}

//Attack
if (distance_to_object(player_obj) < 300 && player_obj.y > y - 64 && player_obj.y < y + 196)
{
	attackCooldown -= global.dt / 4;
}

if (randAttack == 1)
{
	attackInProg1 = true;
}
else
{
	attackInProg2 = true;
}

if (attackCooldown < 60 && attackInProg1)
{
	sprite_index = zombieSoldierGirlAim_spr;
}
if (attackCooldown < 0 && attackInProg1)
{
	var shot = audio_play_sound(shotgunShot_snd, 1, false);
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
	sprite_index = zombieSoldierGirl_spr;
	attackInProg1 = false;
	attackInProg2 = false;
	randAttack = choose(1,2);
}

if (damageTint)
{
	sprite_index = zombieSoldierGirlFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	sprite_index = zombieSoldierGirl_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
}
