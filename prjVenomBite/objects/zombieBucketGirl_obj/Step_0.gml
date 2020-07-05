/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

dirLookat = point_direction(x, y, player_obj.x, player_obj.y);

if (movement)
{
	if (distance_to_object(player_obj) < playerSightMax && distance_to_object(player_obj) > playerSightMin)
	{
		if (player_obj.x > x)
		{
			horspeed = movSpeed;
		}
		else
		{
			horspeed = -movSpeed;
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
	if (x != body.x && y != body.y)
	{
		x = body.x;
		y = body.y - 16;
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

//Cooldown
if (!attackInProg && distance_to_object(player_obj) < 280 && bucketRemoved)
{
	attackCooldown -= global.dt;
	movement = true;
	sprite_index = zombieBucketGirlBroken_spr;
}

//Prepare Attack
if (attackCooldown < 0)
{
	sprite_index = zombieBucketGirlAttack1_spr;
	movement = false;
	attackInProg = true;
	attackCooldown = attackCooldownSave;
}

//Start Attack 1
if (attackInProg && image_index > image_number - 1)
{
	image_index = 0;
	instance_create_layer(x + 10 * image_xscale, y - 10 * image_xscale, "ForegroundObjects", dustParticle_obj);
	repeat(3)
	{
		var grenate = instance_create_layer(x + 10 * image_xscale, y, "Instances", flyingGrenate_obj);
		grenate.horspeed = random_range(1.4, 2.6) * image_xscale;
		grenate.verspeed = random_range(-0.2, -0.8);
	}
	attackInProg = false;
}

if (damageTint)
{
	sprite_index = zombieBucketGirlFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	sprite_index = zombieBucketGirl_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
}