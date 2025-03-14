x -= global.dt * movSpeed;

//Sound Position
if (audio_emitter_exists(honkEmitter)) {
	audio_emitter_position(honkEmitter, x, y, 0);
}

if (instance_exists(player_obj)) {
	if (distance_to_object(player_obj) < 700) {
		audio_play_sound_on(honkEmitter, trainHonk_snd, false, false);
	}
}