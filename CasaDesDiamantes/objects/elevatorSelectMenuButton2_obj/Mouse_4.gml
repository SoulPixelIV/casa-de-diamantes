audio_play_sound(typewriterPush_snd, 1, false);
if (instance_exists(elevator_obj) && room != level_CasinoRoof) {
	elevator_obj.target = 1;
	elevator_obj.used = true;
}
