timer -= global.dt;

if (timer < 0) {
	audio_stop_all();
	room_goto(level1);
}

