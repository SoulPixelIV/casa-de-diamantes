speed = movSpeed * global.dt;

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (horspeed > 0)
{
	horspeed -= 0.02 * global.dt / 3;

	if (horspeed < 0.3)
	{
		horspeed = 0;
	}
}
else
{

	horspeed += 0.02 * global.dt / 3;

	if (horspeed > -0.3)
	{
		horspeed = 0;
	}
}

//Gravity
if (verspeed < 3)
{
	verspeed -= gravityStrength * global.dt / 3;
}

//Collision
if (!place_free(x, y) && !place_meeting(x, y, colliderBulletFree_obj) || place_meeting(x, y, colliderEnemyOnly_obj))
{
	speed = 0;
}

timer -= global.dt;

if (timer < 200)
{
	image_speed = 2;
}
if (timer < 0)
{
	instance_change(explosionTiny_obj, true);
}

//Play sound
if (timer < 200)
{
	if (!playedSound)
	{
		animationSpeed = 0.75;
		var beepShot = audio_play_sound_on(emitter, beep_snd, true, false);
		audio_sound_pitch(beepShot, 0.8);
		playedSound = true;
	}
}

//Audio
audio_emitter_position(emitter, x, y, 0);