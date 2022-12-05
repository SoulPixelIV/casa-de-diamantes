//Casino Theme
if (room == level_Casino || room == mainmenu || room == levelSelect) {
	if (!audio_is_playing(casinoTheme)) {
		audio_play_sound(casinoTheme, 1, true);
		
		if (audio_is_playing(parediaSTEM)) {
			audio_stop_sound(parediaSTEM);
		}
		if (audio_is_playing(parediaL3)) {
			audio_stop_sound(parediaL3);
		}
		if (audio_is_playing(parediaL2)) {
			audio_stop_sound(parediaL2);
		}
		if (audio_is_playing(parediaL1)) {
			audio_stop_sound(parediaL1);
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


//PAREDIA WORLD MUSIC
if (room == level0 || room == level1 || room == level2 || room == level3 || room == level4 || room == level5A || room == level5B) {
	act1MusicOn = true;
} else {
	act1MusicOn = false;
	act1MusicStarted = false;
}

if (act1MusicOn && !act1MusicStarted) {
	parediaSTEM = audio_play_sound(dressedToKillSTEM, 1, true);
	parediaL3 = audio_play_sound(dressedToKillL3, 1, true);
	parediaL2 = audio_play_sound(dressedToKillL2, 1, true);
	parediaL1 = audio_play_sound(dressedToKillL1, 1, true);
	
	audio_sound_gain(parediaSTEM, 0, 0);
	audio_sound_gain(parediaL3, 0, 0);
	audio_sound_gain(parediaL2, 0, 0);
	audio_sound_gain(parediaL1, 0, 0);
	
	act1MusicStarted = true;
}

if (act1MusicOn && act1MusicStarted) {
	with (player_obj) {
		if (place_meeting(x, y, musicBoxAmbience_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(parediaSTEM) == 0) {
					audio_sound_gain(parediaSTEM, 1, 300);
				}
				audio_sound_gain(parediaL3, 0, 300);
				audio_sound_gain(parediaL2, 0, 300);
				audio_sound_gain(parediaL1, 0, 300);
			}
		}
	
		if (place_meeting(x, y, musicBoxAmbience2_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(parediaSTEM) == 0) {
					audio_sound_gain(parediaSTEM, 1, 300);
				}
				if (audio_sound_get_gain(parediaL2) == 0) {
					audio_sound_gain(parediaL2, 1, 300);
				}
				audio_sound_gain(parediaL3, 0, 300);
				audio_sound_gain(parediaL1, 0, 300);
			}
		}
	
		if (place_meeting(x, y, musicBoxFastAmbience_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(parediaSTEM) == 0) {
					audio_sound_gain(parediaSTEM, 1, 300);
				}
				if (audio_sound_get_gain(parediaL1) == 0) {
					audio_sound_gain(parediaL1, 1, 300);
				}
				audio_sound_gain(parediaL3, 0, 300);
				audio_sound_gain(parediaL2, 0, 300);
			}
		}
	
		if (place_meeting(x, y, musicBoxFastAmbience2_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(parediaL1) == 0) {
					audio_sound_gain(parediaL1, 1, 300);
				}
				if (audio_sound_get_gain(parediaL3) == 0) {
					audio_sound_gain(parediaL3, 1, 300);
				}
				audio_sound_gain(parediaSTEM, 0, 300);
				audio_sound_gain(parediaL2, 0, 300);
			}
		}
	
		if (place_meeting(x, y, musicBoxBattle_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(parediaSTEM) == 0) {
					audio_sound_gain(parediaSTEM, 1, 300);
				}
				if (audio_sound_get_gain(parediaL3) == 0) {
					audio_sound_gain(parediaL3, 1, 300);
				}
				audio_sound_gain(parediaL1, 0, 300);
				audio_sound_gain(parediaL2, 0, 300);
			}
		}
	
		if (place_meeting(x, y, musicBoxBattleBig_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(parediaSTEM) == 0) {
					audio_sound_gain(parediaSTEM, 1, 300);
				}
				if (audio_sound_get_gain(parediaL1) == 0) {
					audio_sound_gain(parediaL1, 1, 300);
				}
				if (audio_sound_get_gain(parediaL2) == 0) {
					audio_sound_gain(parediaL2, 1, 300);
				}
				if (audio_sound_get_gain(parediaL3) == 0) {
					audio_sound_gain(parediaL3, 1, 300);
				}
			}
		}
	}
}

/*
//Ambience Theme
with (player_obj) {
	if (!place_meeting(x, y, battleArena_obj) && room != level_Casino && room != blackjackTable) {
		with (musicManager_obj) {
			if (!audio_is_playing(ambienceTheme)) {
				//audio_play_sound(ambienceTheme, 1, true);
			}
		}
	}
}

//Combat Theme
with (player_obj) {
	if (place_meeting(x, y, battleArena_obj) || place_meeting(x, y, minecartForeground_obj) || place_meeting(x, y, plagueDoor_obj)) {
		with (musicManager_obj) {
			if (!audio_is_playing(combatTheme)) {
				//audio_play_sound(combatTheme, 1, true);
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
*/