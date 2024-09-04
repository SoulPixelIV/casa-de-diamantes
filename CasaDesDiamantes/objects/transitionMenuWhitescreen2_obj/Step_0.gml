if (!startedPlayingSound) {
	caveSound = audio_play_sound(caveAmbience3_amb, 1, false);
	startedPlayingSound = true;
}

nextRoomTimer -= global.dt;

if (!setVolume) {
	audio_sound_gain(caveSound, 0, 15000);
	setVolume = true;
}

if (nextRoomTimer < 0) {
	audio_stop_all();
	room_goto(cutscene0);
}