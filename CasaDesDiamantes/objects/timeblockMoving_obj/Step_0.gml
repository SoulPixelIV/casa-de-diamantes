if (vertOrHor == 0) {
	if (dir == 0) {
		x += global.dt;
	} else {
		x -= global.dt;
	}
} else {
	if (dir == 0) {
		y += global.dt;
	} else {
		y -= global.dt;
	}
}

if (open) {
	if (image_index != 4) {
		startDelay -= global.dt;
		if (startDelay < 0) {
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
}

if (used && switchOn) {
	if (!playedSound) {
		spinSound = audio_play_sound_on(emitter, ding_snd, false, false);
		playedSound = true;
	}
	
	image_index = 0;
	startDelay = random_range(1800, 3000);
	countDelay = countDelaySave;
	switchOn = false;
	used = false;
	playedSound = false;
}

if (delayOn) {
	delayTimer -= global.dt;
	
	if (delayTimer < 0) {
		delayTimer = 100;
		delayOn = false;
	}
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

//Audio
if (audio_emitter_exists(emitter)) {
	audio_emitter_position(emitter, x, y, 0);
}