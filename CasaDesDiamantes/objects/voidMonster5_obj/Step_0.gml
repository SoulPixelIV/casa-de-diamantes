y += movspeed * global.dt;

if (!audio_is_playing(jetpack_snd)) {
	audio_play_sound(jetpack_snd, 1, false);
}

part_emitter_region(global.partSystem, voidEmitter, x - 186, x + 186, y - 186, y + 186, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_region(global.partSystem, eyesEmitter, x - 148, x + 148, y - 148, y + 148, ps_shape_ellipse, ps_distr_gaussian);

screenshake(50, 15, 0.6, id);

if (movspeed > movspeedMax) {
	movspeed -= global.dt / 10;
}

if (distance_to_object(player_obj) < 56)
{
	player_obj.hp -= 1;
}