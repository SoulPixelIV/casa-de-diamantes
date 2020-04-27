/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

dirLookat = point_direction(x, y, player_obj.x, player_obj.y);
if (distance_to_object(player_obj) < 128 && distance_to_object(player_obj) > 16)
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
	with (bucketHitbox)
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
}

//Bucket Hitbox
with (bucketHitbox)
{
	if (x != body.x && y != body.y)
	{
		x = body.x;
		y = body.y - 16;
		//move_towards_point(body.x, body.y - 16, 3);
	}
}

//Bucket Destruction
if (hpBucket < 0 && !playedSound)
{
	audio_play_sound(bucketBroken_snd, 1, false);
	playedSound = true;
	sprite_index = zombieBucketGirlBroken_spr;
	with (bucketHitbox)
	{
		instance_destroy();
	}
}

