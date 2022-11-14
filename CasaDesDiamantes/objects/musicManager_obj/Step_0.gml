//Ambience Theme
with (player_obj) {
	if (!place_meeting(x, y, battleArena_obj) && room != level_Casino && room != blackjackTable) {
		with (musicManager_obj) {
			if (!audio_is_playing(ambienceTheme)) {
				audio_play_sound(ambienceTheme, 1, true);
			}
		}
	}
}

//Combat Theme
with (player_obj) {
	if (place_meeting(x, y, battleArena_obj) || place_meeting(x, y, minecartForeground_obj) || place_meeting(x, y, plagueDoor_obj)) {
		with (musicManager_obj) {
			if (!audio_is_playing(combatTheme)) {
				audio_play_sound(combatTheme, 1, true);
			}
			if (audio_is_playing(ambienceTheme)) {
					audio_stop_sound(ambienceTheme);
			}
		}
	} else {
		with (musicManager_obj) {
			audio_stop_sound(combatTheme);
		}
	}
}

//Casino Theme
if (room == level_Casino || room == mainmenu || room == levelSelect) {
	if (!audio_is_playing(casinoTheme)) {
		audio_play_sound(casinoTheme, 1, true);
		if (audio_is_playing(combatTheme)) {
			audio_stop_sound(combatTheme);
		}
		if (audio_is_playing(ambienceTheme)) {
			audio_stop_sound(ambienceTheme);
		}
	}
} else {
	if (audio_is_playing(casinoTheme)) {
		audio_stop_sound(casinoTheme);
	}
}

//Casino Low Pass Theme
if (room == blackjackTable) {
	if (!audio_is_playing(casinoThemeLowPass)) {
		audio_play_sound(casinoThemeLowPass, 1, true);
	}
	if (audio_is_playing(combatTheme)) {
		audio_stop_sound(combatTheme);
	}
	if (audio_is_playing(ambienceTheme)) {
		audio_stop_sound(ambienceTheme);
	}
} else {
	if (audio_is_playing(casinoThemeLowPass)) {
		audio_stop_sound(casinoThemeLowPass);
	}
}