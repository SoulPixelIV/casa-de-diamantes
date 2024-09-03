open = true;
if (room == mainmenu) {
	if (mainmenu_obj.cursorPos != index) {
		if (index != 4 && index != 5) {
			audio_play_sound(typewriter_snd, 1, false);
		} else {
			if (mainmenu_obj.drawStartMenu) {
				audio_play_sound(typewriter_snd, 1, false);
			}
		}
	}
} else if (room == settings) {
	if (settings_obj.cursorPos != index) {
		audio_play_sound(typewriter_snd, 1, false);
	}
} else if (instance_exists(camera_obj)) {
	if (camera_obj.cursorPos != index) {
		audio_play_sound(typewriter_snd, 1, false);
	}
} else if (room == blackjackTable) {
	if (cameraBlackjack_obj.cursorPos != index) {
		if (blackJackCalc_obj.screen == 1) {
			audio_play_sound(typewriter_snd, 1, false);
		}
	}
} else {
	audio_play_sound(typewriter_snd, 1, false);
}