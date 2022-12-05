function jump_scr() {
	//Do not allow infinite roof jumps
	if (player_obj.crouchslide) {
		player_obj.verspeed = -player_obj.jumpStrength / 1.4;
		player_obj.jumpType = 1;
	}
	else if ((player_obj.isDashing && place_free(x, y - 34)) || !player_obj.isDashing) {
		if (player_obj.grounded || (player_obj.fallJumpSafety > 0 && !player_obj.grounded))
		{
			player_obj.verspeed = -player_obj.jumpStrength;
			player_obj.jumpType = 1;
		}
		else
		{
			player_obj.verspeed = -player_obj.jumpStrength / 1.4;
			player_obj.jumpType = 2;
			if (!audio_is_playing(glitter_snd))
			{
				var glittersnd = audio_play_sound(glitter_snd, 1, false);
				audio_sound_pitch(glittersnd, random_range(0.9, 1.1));
			}
			if (!audio_is_playing(jumpspin_snd))
			{
				var jumpspinsnd = audio_play_sound(jumpspin_snd, 1, false);
				audio_sound_pitch(jumpspinsnd, random_range(0.9, 1.1));
			}
			if (!audio_is_playing(doublejumpmoan_snd))
			{
				var doublejumpmoansnd = audio_play_sound(doublejumpmoan_snd, 1, false);
				audio_sound_pitch(doublejumpmoansnd, random_range(0.9, 1.1));
			}
			repeat(8)
			{
				instance_create_layer(player_obj.x + choose(-6, 6), player_obj.y + 26 + choose(-2, 2), "ForegroundObjects", dustParticle_obj);
			}
		}
	}
	//Dash Momentum after jump
	if ((player_obj.isDashing && place_free(x, y - 34)))
	{
		player_obj.stoppedDashing = true;
		player_obj.stillInAir = true;
		if (player_obj.horspeed == 0)
		{
			if (player_obj.image_xscale == 1)
			{
				player_obj.horspeed += 0.2;
			}
			else
			{
				player_obj.horspeed -= 0.2;
			}
				
		}
		else
		{
			if (player_obj.horspeed > 0)
			{
				player_obj.horspeed += 0.2;
			}
			if (player_obj.horspeed < 0)
			{
				player_obj.horspeed -= 0.2;
			}
		}
	}
	if (!audio_is_playing(glitter_snd)) {
		var glittersnd = audio_play_sound(glitter_snd, 1, false);
		audio_sound_pitch(glittersnd, random_range(0.9, 1.1));
	}
	repeat(8)
	{
		instance_create_layer(player_obj.x + choose(-6, 6), player_obj.y + 26 + choose(-2, 2), "ForegroundObjects", dustParticle_obj);
	}
	
	if (player_obj.jumpType == 1) {
		if (!audio_is_playing(jumpmoan_snd)) {
			var jumpmoansnd = audio_play_sound(jumpmoan_snd, 1, false);
			audio_sound_pitch(jumpmoansnd, random_range(0.9, 1.1));
		}
	}
	
	player_obj.jumping = true;
	player_obj.onLadder = false;
	player_obj.reachedGroundOnce = false;
	player_obj.dashLastSpriteReached = false;
	player_obj.dashDustEndTimer = player_obj.dashDustEndTimerSave;
	player_obj.crouchRollTimer = player_obj.crouchRollTimerSave;
	player_obj.dashroll = false;
	player_obj.crouchslide = false;
	player_obj.dashjumpbuffer = false;
	player_obj.dashStartDelay = player_obj.dashStartDelaySave;
	player_obj.boosterLockedMovement = false;
	player_obj.boosterLockedMovementTimer = player_obj.boosterLockedMovementTimerSave;
	if (!player_obj.isDashing)
	{
		player_obj.image_index = 0;
	}
	audio_play_sound(jump_snd, 1, false);
	landSoundPlayed = false;
}
