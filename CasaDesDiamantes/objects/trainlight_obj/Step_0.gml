if (trainPhase == 0) {
	image_speed = 0;
	image_index = 0;
	
	if (playingAudio) {
		if (audio_is_playing(currAudio)) {
			playingAudio = false;
			audio_stop_sound(currAudio);
		}
	}
}

if (trainPhase == 1) {
	image_speed = 0;
	image_index += (global.dt / 15) * animationSpeed;
	
	if (!playingAudio) {
		currAudio = audio_play_sound_on(alarmEmitter, trainCrossingAlarm_snd, false, 1);
		playingAudio = true;
	}
}

if (trainPhase == 2) {
	image_speed = 0;
	image_index = 1;
}

if (instance_exists(stratoTrainComplete_obj)) {
	var train = instance_nearest(x, y, stratoTrainComplete_obj);
	if (distance_to_object(train) < 1400) {
		trainPhase = 1;
	} else {
		trainPhase = 0;
	}
}