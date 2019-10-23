/// @description Enemy AI

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

x += horspeed * dt;
y += verspeed * dt;

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
	verspeed -= gravityStrength * dt;
}

//Collision
//horspeed
if (!place_free(x + horspeed, y))
{
    while (place_free(x + sign(horspeed), y))
    {
        x += sign(horspeed * dt);
    }
    horspeed = 0;
} 
//verspeed
if (!place_free(x, y + verspeed))
{
    while (place_free(x, y + sign(verspeed)))
    {
        y += sign(verspeed * dt);
    }
    verspeed = 0;   
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

