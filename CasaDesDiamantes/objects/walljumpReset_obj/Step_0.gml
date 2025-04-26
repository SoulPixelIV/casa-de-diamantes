if (instance_exists(player_obj)) {
	if (place_meeting(x, y, player_obj)) {
		player_obj.wallJumps = player_obj.wallJumpsMax;
		audio_play_sound(healthPickup_snd, 1, false);
		instance_destroy();
	}
}
