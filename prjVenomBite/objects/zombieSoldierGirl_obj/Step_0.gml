/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

dirLookat = point_direction(x, y, player_obj.x, player_obj.y);
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

//Gravity
if (verspeed < 14)
{
	verspeed -= gravityStrength * global.dt;
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
	with (headshotHitbox)
	{
		instance_destroy();
	}
	global.scorepoints += points * global.multiplier;
	global.multiplier += 1;
	global.multiplierTimer = 300;
	gameManager_obj.multiplierRun = true;
	camera_obj.scoreShake = true;
	camera_obj.vignetteStrength = 3;
	player_obj.enemySlowmo = true;
	instance_destroy();
	
	//Drop Money
	var maxAmount = random_range(moneyDropMin, moneyDropMax);
	for (i = 0; i < maxAmount; i++)
	{
		chip = choose(1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3)
		
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
if (distance_to_object(player_obj) < 700 && player_obj.y > y - 64 && player_obj.y < y + 196)
{
	attackCooldown -= global.dt / 4;
}

if (attackCooldown < 60)
{
	sprite_index = zombieSoldierGirlAim_spr;
}
if (attackCooldown < 0)
{
	audio_sound_pitch(shotgunShot_snd, random_range(0.9, 1.1));
	audio_play_sound(shotgunShot_snd, 1, false);
		
	instance_create_layer(x + 10, y, "Instances", bulletZombieSoldierGirl_obj);
	instance_create_layer(x + 10, y, "Instances", shotLightDualBarettas_obj);	

	attackCooldown = attackCooldownSave;
	sprite_index = zombieSoldierGirl_spr;
}

