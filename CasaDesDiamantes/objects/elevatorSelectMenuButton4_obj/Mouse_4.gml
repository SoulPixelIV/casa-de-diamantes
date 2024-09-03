audio_play_sound(typewriterPush_snd, 1, false);
if (instance_exists(elevator_obj) && room != level_DiningHall) {
	elevator_obj.target = 5;
	elevator_obj.used = true;
}
