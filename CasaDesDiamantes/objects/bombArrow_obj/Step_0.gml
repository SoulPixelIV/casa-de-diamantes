if (!stuckInEnemy) {
	x += horspeed * global.dt / 3;
	y += verspeed * global.dt / 3;
	image_angle += global.dt / 5;

	//Invincibility
	if (invincibilityTimer > 0)
	{
		invincibilityTimer -= global.dt;
	}

	if (dealtDamage)
	{
		penetrationTime -= global.dt;
	}
	if (penetrationTime < 0)
	{
		dealtDamage = false;
		penetrationTime = 3;
	}

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
	if (invincibilityTimer <= 0)
	{
		//horspeed
		if (!place_free(x + horspeed, y))
		{
			if (!stuckInEnemy && !playedSound2) {
				audio_play_sound_on(emitter, arrowImpact_snd, false, false);
				playedSound2 = true;
			    stuckInEnemy = true;
			}
		} 
		//verspeed
		if (!place_free(x, y + verspeed))
		{
		    if (!stuckInEnemy && !playedSound2) {
				audio_play_sound_on(emitter, arrowImpact_snd, false, false);
				playedSound2 = true;
			    stuckInEnemy = true;
			}
		}
	}

	timer -= global.dt;

	if (timer < 0)
	{
		instance_change(explosion_obj, true);
	}

	//Play sound
	if (timer < 200)
	{
		if (!playedSound)
		{
			var beepShot = audio_play_sound_on(emitter, beep_snd, true, false);
			audio_sound_pitch(beepShot, 0.8);
			playedSound = true;
		}
	}
}

if (stuckInEnemy) {
	horspeed = 0;
	verspeed = 0;
	if (instance_exists(nearestEnemy)) {
		x = distXToEnemy + nearestEnemy.x;
		y = distYToEnemy + nearestEnemy.y;
	}
	
	alarmDelayTimer -= global.dt;
	
	if (alarmDelayTimer < 0) {
		timer -= global.dt;
		image_speed = 1;
	}

	if (timer < 0)
	{
		instance_change(explosionTinyOnlyEnemy_obj, true);
	}

	//Play sound
	if (timer < 100)
	{
		if (!playedSound)
		{
			var beepShot = audio_play_sound_on(emitter, beep_snd, true, false);
			audio_sound_pitch(beepShot, 0.8);
			playedSound = true;
		}
	}
}

//Audio
audio_emitter_position(emitter, x, y, 0);