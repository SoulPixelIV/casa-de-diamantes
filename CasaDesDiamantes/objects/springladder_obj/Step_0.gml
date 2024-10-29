if (moving) {
	y -= global.dt * 1.7;
} else {
	if (!open || (open && movedShortcut)) {
		if (y < startPos) {
			//if (!playedSound) {
				//audio_play_sound_on(emitter, springLadderShortcut_snd, true, 1);
				//playedSound = true;
			//}
			y += global.dt * 2;
		}
	}
}

if (instance_exists(player_obj)) {
	if (!player_obj.onSpringLadder) {
		moving = false;
	}
}

if (global.level15Spring && index == 1) {
	open = true;
}

if (shortcut && open && !movedShortcut) {
	y += global.dt * 1.2;
	startPos = y;
}

//Sound Position
audio_emitter_position(emitter, x, y, 0);



