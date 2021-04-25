/// @description Enemy AI

y += verspeed * global.dt;

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//###Death###
if (hp <= 0)
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
	var randDrop = choose(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,3,4)
	if (randDrop == 2)
	{
		instance_create_layer(x, y - 16, "Instances", healthpackPickup_obj);
	}
	if (randDrop == 3)
	{
		instance_create_layer(x, y - 16, "Instances", ammoPackPistolPickup_obj);
	}
	if (randDrop == 4)
	{
		instance_create_layer(x, y - 16, "Instances", ammoPackShotgunPickup_obj);
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
	if (headshot)
	{
		instance_change(zombieGirlDeath1_obj, true);
	}
	else
	{
		instance_change(zombieGirlDeath2_obj, true);
	}
	instance_destroy(alarmLight);
	with (barrelHitbox)
	{
		image_xscale = 1;
		image_yscale = 1;
		instance_change(choose(explosion_obj, explosionBig_obj), true);
	}
}

//Barrel Hitbox
with (barrelHitbox)
{
	if (body.image_xscale == 1)
	{
		x = body.x + 24;
		image_angle = -24;
	}
	else
	{
		x = body.x - 24;
		image_angle = 24;
	}
	y = body.y + 4;
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
	sprite_index = explosiveMerchantDead_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
}

if (open)
{
	gravityStrength = -0.05;
}

checkPlayerTimer -= global.dt;
if (checkPlayerTimer < 0)
{
	if (instance_exists(camera_obj))
	{
		if (distance_to_object(camera_obj) < (camera_obj.xScreenSize / 2) + 128)
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
	checkPlayerTimer = checkPlayerTimerSave;
}

