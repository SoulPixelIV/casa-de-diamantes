function dash_scr() {
	
	if (!audio_is_playing(dashmoan_snd))
	{
		var dashmoansnd = audio_play_sound(dashmoan_snd, 1, false);
		audio_sound_pitch(dashmoansnd, random_range(0.9, 1.1));
	}
	
	player_obj.isDashing = true;
	player_obj.dashDelay = player_obj.dashDelaySave;

	player_obj.verspeed = -player_obj.jumpStrength / 2.5;
	
	player_obj.boosterLockedMovement = false;
	player_obj.boosterLockedMovementTimer = player_obj.boosterLockedMovementTimerSave;
	
	if (player_obj.horspeed < 0)
	{
		player_obj.horspeed -= player_obj.dashSpeed;
		
		//Minimum dash speed
		if (player_obj.horspeed > -1.47) {
			player_obj.horspeed = -1.47;
		}
	}
	
	if (player_obj.horspeed > 0)
	{
		player_obj.horspeed += player_obj.dashSpeed;
		
		//Minimum dash speed
		if (player_obj.horspeed < 1.47) {
			player_obj.horspeed = 1.47;
		}
	}
	
	if (player_obj.horspeed == 0)
	{
		if (player_obj.dirCursor > 90 && dirCursor < 270) {
			player_obj.horspeed -= player_obj.dashSpeed;
			
			//Minimum dash speed
			if (player_obj.horspeed > -1.47) {
				player_obj.horspeed = -1.47;
			}
		}
		if (player_obj.dirCursor < 90 || dirCursor > 270) {
			player_obj.horspeed += player_obj.dashSpeed;
			
			//Minimum dash speed
			if (player_obj.horspeed < 1.47) {
				player_obj.horspeed = 1.47;
			}
		}
	}
}
