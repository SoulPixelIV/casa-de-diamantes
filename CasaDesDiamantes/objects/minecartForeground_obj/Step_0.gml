if (inMinecart)
{
	player_obj.movement = false;
	player_obj.invincible = true;
	player_obj.colliding = false;
	
	camera_obj.follow = self;
	
	player_obj.x = x;
	player_obj.y = y - 30;
}

if (instance_exists(player_obj))
{
	if (inMinecart && player_obj.key_left)
	{
		horspeed -= movSpeed;
	}
	if (inMinecart && player_obj.key_right)
	{
		horspeed += movSpeed;
	}

	if (inMinecart)
	{
		if (horspeed > 0 && !player_obj.key_right)
		{
			horspeed -= global.dt / 400;
			if (horspeed < 0.3)
			{
				horspeed = 0;
			}
		}
		if (horspeed < 0 && !player_obj.key_left)
		{
			horspeed += global.dt / 400;
			if (horspeed > -0.3)
			{
				horspeed = 0;
			}
		}
	}
	else
	{
		if (horspeed > 0)
		{
			horspeed -= global.dt / 400;
			if (horspeed < 0.3)
			{
				horspeed = 0;
			}
		}
		if (horspeed < 0)
		{
			horspeed += global.dt / 400;
			if (horspeed > -0.3)
			{
				horspeed = 0;
			}
		}
	}
}

//Max Speed
if (horspeed > 2.3)
{
	horspeed = 2.3;
}
if (horspeed < -2.3)
{
	horspeed = -2.3;
}

//Gravity
if (verspeed < 14)
{
	verspeed -= gravityStrength * global.dt;
}

//Collision
//horspeed
if (!place_free(x + horspeed * global.dt, y))
{
	if (sign(horspeed) != 0)
	{
		while (place_free(x + sign(horspeed), y))
		{
			x += sign(horspeed);
		}
		horspeed = 0;
	}
} 
//verspeed
if (!place_free(x, y + verspeed * global.dt))
{
	if (sign(verspeed) != 0)
	{
		while (place_free(x, y + sign(verspeed)))
		{
			y += sign(verspeed);
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
    verspeed = 0;
}

if (instance_exists(player_obj))
{
	if (player_obj.key_jump && inMinecart)
	{
		inMinecart = false;
		player_obj.grounded = false;
		player_obj.movement = true;
		player_obj.invincible = false;
		player_obj.horspeed += horspeed;
		player_obj.x = x;
		player_obj.y = y - 64;
		jump_scr();
		camera_obj.follow = player_obj;
		player_obj.colliding = true;
	}
}

x += horspeed * global.dt;
y += verspeed * global.dt;