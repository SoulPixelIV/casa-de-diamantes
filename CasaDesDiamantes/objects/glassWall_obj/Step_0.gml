if (instance_exists(player_obj)) {
	if (place_meeting(x, y, player_obj) && player_obj.isDashing) {
		active = true;
	}
}

if (active) {
	player_obj.slowmo = true;
	part_emitter_burst(global.partSystem, glasShardEmitter, global.glasShardsSlowmoPart, 5);
	whitesquare_obj.image_alpha += global.dt / 80;
	if (!spawnedParticles) {
		audio_play_sound_on(emitter, glassBreaking_snd, false, false);
		spawnedParticles = true;
	}
	delayToTeleport -= global.dt;
	
	if (delayToTeleport < 0) {
		part_emitter_destroy_all(global.partSystem);
		player_obj.slowmo = false;
		instance_destroy(player_obj);
		active = false;
		room_goto(level28);
	}
}