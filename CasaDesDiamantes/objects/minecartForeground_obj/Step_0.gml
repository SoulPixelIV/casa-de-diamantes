if (inMinecart)
{
	player_obj.movement = false;
	player_obj.colliding = false;
	player_obj.isDashing = false;
	player_obj.dashroll = false;
	player_obj.activateTrailEffect = true;
	
	if (!camera_obj.follow = camera_obj) {
		camera_obj.follow = self;
	}
	
	player_obj.x = x;
	player_obj.y = y - 32;
	
	if (!playedSound) {
		minecartSound = audio_play_sound_on(emitter, minecart_snd, true, false);
		audio_sound_gain(minecart_snd, 1 * abs(horspeed), 0);
		playedSound = true;
	}
} else {
	audio_stop_sound(minecart_snd);
	playedSound = false;
}

//Audio
if (audio_emitter_exists(emitter)) {
	audio_emitter_position(emitter, x, y, 0);
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
			horspeed -= movSpeed / 5;
			if (horspeed < 0.1)
			{
				horspeed = 0;
			}
		}
		if (horspeed < 0 && !player_obj.key_left)
		{
			horspeed += movSpeed / 5;
			if (horspeed > -0.1)
			{
				horspeed = 0;
			}
		}
	}
	else
	{
		if (horspeed > 0)
		{
			horspeed -= movSpeed / 5;
			if (horspeed < 0.1)
			{
				horspeed = 0;
			}
		}
		if (horspeed < 0)
		{
			horspeed += movSpeed / 5;
			if (horspeed > -0.1)
			{
				horspeed = 0;
			}
		}
	}
}

//Max Speed
if (horspeed > 1.65)
{
	horspeed = 1.65;
}
if (horspeed < -1.65)
{
	horspeed = -1.65;
}

//Gravity
if (verspeed < 5)
{
	verspeed -= gravityStrength * global.dt;
}

//Player Trail
if (horspeed != 0) {
	trailDensity -= global.dt;
}
if (trailDensity < 0) {
	var trail = instance_create_layer(x, y, "Instances", minecartTrail_obj);
	trail.sprite_index = sprite_index;
	trail.image_speed = 0;
	trail.image_index = image_index
	trailDensity = trailDensitySave;
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

if (instance_exists(player_obj))
{
	if (player_obj.key_jump && inMinecart && !global.pause)
	{
		inMinecart = false;
		player_obj.grounded = false;
		player_obj.activateTrailEffect = false;
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