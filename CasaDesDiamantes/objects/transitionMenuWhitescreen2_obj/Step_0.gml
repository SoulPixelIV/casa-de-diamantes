if (!startedPlayingSound) {
	audio_play_sound(caveAmbience3_amb, 1, false);
	startedPlayingSound = true;
}

nextRoomTimer -= global.dt;

if (nextRoomTimer < 0) {
	audio_stop_all();
	room_goto(cutscene0);
}