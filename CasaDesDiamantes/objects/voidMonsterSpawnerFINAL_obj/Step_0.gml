if (dir == 0) {
	x += global.dt / 2;
}
if (dir == 1) {
	x -= global.dt / 2;
}
if (dir == 2) {
	y += global.dt / 2;
}
if (dir == 3) {
	y -= global.dt / 2;
}

audioDelay -= global.dt;

if (audioDelay < 0 && !playedSound) {
	audio_play_sound_on(emitter, jetpack_snd, true, 1);
	playedSound = true;
}

if (instance_exists(player_obj)) {
	if (distance_to_object(player_obj) < 256) {
		screenshake(50, 20, 0.6, id);
	}
	
	if (place_meeting(x, y, player_obj)) {
		audio_stop_all();
		part_emitter_destroy_all(global.partSystem);
		room_goto(staticnoise);
	}
}

part_emitter_region(global.partSystem, voidEmitter, x - 114, x + 114, y - 114, y + 114, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_region(global.partSystem, eyesEmitter, x - 114, x + 114, y - 114, y + 114, ps_shape_ellipse, ps_distr_gaussian);

audio_emitter_position(emitter, x, y, 0);