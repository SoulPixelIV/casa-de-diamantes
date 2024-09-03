audio_play_sound(typewriterPush_snd, 1, false);
if (instance_exists(elevator_obj) && room == level_Casino) {
	elevator_obj.target = 3;
	elevator_obj.used = true;
}

if (instance_exists(elevator_obj) && room == level_CasinoRoof) {
	elevator_obj.target = 4;
	elevator_obj.used = true;
}

if (instance_exists(elevator_obj) && room == level_DiningHall) {
	elevator_obj.target = 4;
	elevator_obj.used = true;
}

if (instance_exists(elevator_obj) && room == level_Basement) {
	elevator_obj.target = 4;
	elevator_obj.used = true;
}
