lifeTimer -= global.dt;
healDelay -= global.dt;

if (!streamedParts) {
	smokePinkEmitter = part_emitter_create(global.partSystem);
	part_emitter_burst(global.partSystem, smokePinkEmitter, global.smokePinkPart, 60);
	part_emitter_burst(global.partSystem, smokePinkEmitter, global.healthPart, 28);
	part_emitter_region(global.partSystem, smokePinkEmitter, x - 64, x + 64, y - 64, y + 64, ps_shape_ellipse, ps_distr_gaussian);
	streamedParts = true;
}

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
