if (instance_exists(player_obj)) {
	if (place_meeting(x, y, player_obj) && player_obj.isDashing) {
		global.timeScale = 0.1;
		if (!spawnedParticles) {
			part_emitter_burst(global.partSystem, glasShardEmitter, global.glasShardsPart, 50);

			part_emitter_destroy(global.partSystem, glasShardEmitter);

			audio_play_sound_on(emitter, glassBreaking_snd, false, false);
			spawnedParticles = true;
		}
	}
}
