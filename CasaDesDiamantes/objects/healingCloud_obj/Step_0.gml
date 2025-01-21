lifeTimer -= global.dt;
healDelay -= global.dt;

if (lifeTimer < 0) {
	instance_destroy();
}

if (healDelay < 0) {
	if (instance_exists(player_obj)) {
		if (place_meeting(x, y, player_obj)) {
			if (player_obj.hp < 100) {
				if (!audio_is_playing(healthPickup_snd)) {
					audio_play_sound(healthPickup_snd, 1, false);
				}
				player_obj.hp += 1;
				healDelay = healDelaySave;
			}
		}
	}
}
