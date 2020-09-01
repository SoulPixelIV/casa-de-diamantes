function jump_scr() {
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
		partEmitter = part_emitter_create(global.partSystem);
		part_emitter_region(global.partSystem, partEmitter, player_obj.x - 32, player_obj.x + 32, player_obj.y + 8, player_obj.y + 32, ps_shape_ellipse, ps_distr_linear);
		part_emitter_burst(global.partSystem, partEmitter, global.playerPart, 50);
		part_emitter_destroy(global.partSystem, partEmitter);
	}

	if (player_obj.isDashing)
	{
		player_obj.stoppedDashing = true;
		if (player_obj.image_xscale == 1)
		{
			player_obj.horspeed += 1.2;
		}
		if (player_obj.image_xscale == -1)
		{
			player_obj.horspeed -= 1.2;
		}
	}
	player_obj.jumping = true;
	if (!player_obj.isDashing)
	{
		player_obj.image_index = 0;
	}
	audio_play_sound(jump_snd, 1, false);
	landSoundPlayed = false;



}
