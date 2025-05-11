if (open) {
	if (image_index != 4) {
		startDelay -= global.dt;
		if (startDelay < 0) {
			if (!playedStartSound) {
				audio_play_sound_on(emitter, emptyClip_snd, false, false);
				playedStartSound = true;
			}
			if (!switchOn) {
				image_index = 1;
				switchOn = true;
			}
			countDelay -= global.dt;
			if (countDelay < 0) {
				image_index++;
				countDelay = countDelaySave;
			}
		}
	}
	
	if (used && switchOn) {
	if (!playedSound) {
		spinSound = audio_play_sound_on(emitter, ding_snd, false, false);
		playedSound = true;
	}
	
	image_index = 0;
	startDelay = random_range(800, 2800);
	countDelay = countDelaySave;
	switchOn = false;
	used = false;
	playedSound = false;
	playedStartSound = false;
	}

	if (image_index == 4) {
		if (!playedSound) {
			alarmSound = audio_play_sound_on(emitter, sniperShotLoad_snd, false, false);
			playedSound = true;
		}
		if (instance_exists(spikesMovingUp_obj)) {
			for (var i = 0; i < instance_number(spikesMovingUp_obj); ++i;) {
			    spikes[i] = instance_find(spikesMovingUp_obj, i);
				spikes[i].open = true;
			}
		}
		if (instance_exists(spikesMovingDown_obj)) {
			for (var i = 0; i < instance_number(spikesMovingDown_obj); ++i;) {
			    spikes[i] = instance_find(spikesMovingDown_obj, i);
				spikes[i].open = true;
			}
		}
	}
} else {
	image_index = 0;
	startDelay = random_range(200, 3500);
	countDelay = countDelaySave;
	switchOn = false;
	used = false;
	spinDone = false;
	spawned = false;
	playedSound = false;
}



//Audio
if (audio_emitter_exists(emitter)) {
	audio_emitter_position(emitter, x, y, 0);
}