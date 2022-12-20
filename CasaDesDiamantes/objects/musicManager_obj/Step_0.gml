//Casino Theme
if (room == level_Casino || room == mainmenu || room == levelSelect) {
	if (!audio_is_playing(casinoTheme)) {
		audio_play_sound(casinoTheme, 1, true);
		
		if (audio_is_playing(dressedToKillSTEM_msc)) {
			audio_stop_sound(dressedToKillSTEM_msc);
		}
		if (audio_is_playing(dressedToKillL3_msc)) {
			audio_stop_sound(dressedToKillL3_msc);
		}
		if (audio_is_playing(dressedToKillL2_msc)) {
			audio_stop_sound(dressedToKillL2_msc);
		}
		if (audio_is_playing(dressedToKillL1_msc)) {
			audio_stop_sound(dressedToKillL1_msc);
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


//ACT1 WORLD MUSIC
if (room == level0 || room == level1 || room == level2 || room == level3 || room == level4 || room == level5A || room == level5B || room == level6 || room == warpzone1) {
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
		
		if (place_meeting(x, y, musicBoxSilence_obj)) {
			with (musicManager_obj) {
				audio_sound_gain(parediaSTEM, 0, 300);
				audio_sound_gain(parediaL1, 0, 300);
				audio_sound_gain(parediaL2, 0, 300);
				audio_sound_gain(parediaL3, 0, 300);
			}
		}
	}
}

//ACT2 WORLD MUSIC
if (room == level4 || room == level5A || room == level5B) {
	act2MusicOn = true;
} else {
	act2MusicOn = false;
	act2MusicStarted = false;
}

if (act2MusicOn && !act2MusicStarted) {
	cave1 = audio_play_sound(caveAmbience1, 1, true);
	cave2 = audio_play_sound(caveAmbience2, 1, true);
	cave3 = audio_play_sound(caveAmbience3, 1, true);
	cave4 = audio_play_sound(caveAmbience4, 1, true);
	
	act2MusicStarted = true;
}