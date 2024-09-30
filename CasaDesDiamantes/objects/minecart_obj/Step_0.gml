//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!offline) {
	enterDelay -= global.dt;

	if (inMinecart)
	{
		player_obj.movement = false;
		player_obj.colliding = false;
		player_obj.isDashing = false;
		player_obj.dashroll = false;
		player_obj.activateTrailEffect = true;
	
		if (instance_exists(camera_obj)) {
			camera_obj.minecartCamera = true;
		}
	
		if (image_xscale == 1) {
			player_obj.x = x - 46;
		} else {
			player_obj.x = x + 46;
		}
	
		player_obj.y = y - 16;
	}

	//Audio
	if (audio_emitter_exists(emitter)) {
		audio_emitter_position(emitter, x, y, 0);
	}
	if (audio_exists(minecartSound)) {
		audio_sound_gain(minecartSound, 1 * abs(horspeed), 0);
	}

	if (instance_exists(player_obj))
	{
		if (inMinecart && player_obj.key_left)
		{
			horspeed -= movSpeed;
			animationSpeed -= movSpeed;
		}
		if (inMinecart && player_obj.key_right)
		{
			horspeed += movSpeed;
			animationSpeed += movSpeed;
		}

		if (inMinecart)
		{
			if (horspeed > 0 && !player_obj.key_right)
			{
				horspeed -= movSpeed / 5;
				animationSpeed -= movSpeed / 5;
				if (horspeed < 0.1)
				{
					horspeed = 0;
				}
				if (animationSpeed < 0.2) {
					animationSpeed = 0;
				}
			}
			if (horspeed < 0 && !player_obj.key_left)
			{
				horspeed += movSpeed / 5;
				animationSpeed += movSpeed / 5;
				if (horspeed > -0.1)
				{
					horspeed = 0;
				}
				if (animationSpeed > -0.2) {
					animationSpeed = 0;
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
		
			if (animationSpeed > 0)
			{
				animationSpeed -= movSpeed / 5;
				if (animationSpeed < 0.2)
				{
					animationSpeed = 0;
				}
			}
			if (animationSpeed < 0)
			{
				animationSpeed += movSpeed / 5;
				if (animationSpeed > -0.2)
				{
					animationSpeed = 0;
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

	//Max Animation Speed
	if (animationSpeed > animationSpeedMax) {
		animationSpeed = animationSpeedMax;
	}
	if (animationSpeed < -animationSpeedMax) {
		animationSpeed = -animationSpeedMax;
	}

	if (horspeed > 0.5 || horspeed < -0.5) {
		playedCrashSound = false;
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
		trail.image_xscale = image_xscale;
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
			if (!playedCrashSound) {
				audio_play_sound_on(emitter, minecartHit_snd, false, 1);
				screenshake(60, 24, 0.7, id);
				playedCrashSound = true;
				animationSpeed = 0;
			}
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
			player_obj.sittingInMinecart = false;
			player_obj.horspeed += horspeed;
			if (image_xscale == 1) {
				player_obj.x = x - 46;
			} else {
				player_obj.x = x + 46;
			}
			player_obj.y = y - 42;
			jump_scr();
			camera_obj.follow = player_obj;
			camera_obj.minecartCamera = false;
			camera_obj.follow = player_obj;
			camera_obj.cameraSpeed = 0.02;
			camera_obj.ycameraSpeed = 0.02;
			player_obj.colliding = true;
			enterDelay = enterDelaySave;
		}
	}

	x += horspeed * global.dt;
	y += verspeed * global.dt;
} else {
	sprite_index = minecartNoLights_spr;
	if (audio_exists(minecartSound)) {
		audio_stop_sound(minecartSound);
	}
}