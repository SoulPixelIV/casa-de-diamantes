x += movspeed * global.dt;

if (!audio_is_playing(jetpack_snd)) {
	audio_play_sound(jetpack_snd, 1, false);
}

part_emitter_region(global.partSystem, voidEmitter, x - 186, x + 186, y - 186, y + 186, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_region(global.partSystem, eyesEmitter, x - 148, x + 148, y - 148, y + 148, ps_shape_ellipse, ps_distr_gaussian);

screenshake(50, 15, 0.6, id);

if (movspeed > movspeedMax) {
	movspeed -= global.dt / 10;
}

if (distance_to_object(player_obj) < 48)
{
	teleporting = true;
	player_obj.movement = false;
	global.keyRed = false;
	global.keyBlue = false;
	global.keyYellow = false;
}

if (teleporting) {
	blackscreen_scr(0);
	blackscreenDelay -= global.dt;
}

if (blackscreenDelay < 0) {
	finishingTeleport = true;
	blackscreenDelay = blackscreenDelaySave;
	teleporting = false;
}

if (finishingTeleport) {
	waitDelay -= global.dt;
	if (waitDelay < 0) {	
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		room_goto(level11);
	}
}