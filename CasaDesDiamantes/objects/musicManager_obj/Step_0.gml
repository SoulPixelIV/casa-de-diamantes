//Volume
audio_emitter_gain(musicEmitter, global.musicVolume / 100);

if (instance_exists(player_obj)) {
	audio_emitter_position(musicEmitter, player_obj.x, player_obj.y, 0);
}

if (global.pause) {
	if (!usedFilter) {
		musicBus.effects[0] = _lp_effect;
		usedFilter = true;
	}
} else {
	if (usedFilter) {
		musicBus.effects[0] = undefined;
		usedFilter = false;
	}
}

//Credits Theme
if (room == credits) {
	if (!audio_is_playing(credits_msc)) {
		audio_play_sound_on(musicEmitter, credits_msc, 1, 1);
		
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
		
		if (audio_is_playing(birchL1_msc)) {
			audio_stop_sound(birchL1_msc);
		}
		if (audio_is_playing(birchL2_msc)) {
			audio_stop_sound(birchL2_msc);
		}
		if (audio_is_playing(birchL3_msc)) {
			audio_stop_sound(birchL3_msc);
		}
		
		if (audio_is_playing(caveAmbience1)) {
			audio_stop_sound(caveAmbience1);
		}
		if (audio_is_playing(caveAmbience2)) {
			audio_stop_sound(caveAmbience2);
		}
		if (audio_is_playing(caveAmbience3)) {
			audio_stop_sound(caveAmbience3);
		}
		if (audio_is_playing(caveAmbience4)) {
			audio_stop_sound(caveAmbience4);
		}
		
		if (audio_is_playing(nuclidesL1_msc)) {
			audio_stop_sound(nuclidesL1_msc);
		}
		if (audio_is_playing(nuclidesL2_msc)) {
			audio_stop_sound(nuclidesL2_msc);
		}
		if (audio_is_playing(nuclidesL3_msc)) {
			audio_stop_sound(nuclidesL3_msc);
		}
		
		if (audio_is_playing(feastL1_msc)) {
			audio_stop_sound(feastL1_msc);
		}
		if (audio_is_playing(feastL2_msc)) {
			audio_stop_sound(feastL2_msc);
		}
		
		if (audio_is_playing(sliceCom_msc)) {
			audio_stop_sound(sliceCom_msc);
		}
		if (audio_is_playing(sliceExp_msc)) {
			audio_stop_sound(sliceExp_msc);
		}

	}
} else {
	if (audio_is_playing(credits_msc)) {
		audio_stop_sound(credits_msc);
	}
}

//Endscreen Theme
if (room == demoend) {
	if (!audio_is_playing(powerplant_msc)) {
		audio_play_sound_on(musicEmitter, powerplant_msc, 1, 1);
		
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
		
		if (audio_is_playing(birchL1_msc)) {
			audio_stop_sound(birchL1_msc);
		}
		if (audio_is_playing(birchL2_msc)) {
			audio_stop_sound(birchL2_msc);
		}
		if (audio_is_playing(birchL3_msc)) {
			audio_stop_sound(birchL3_msc);
		}
		
		if (audio_is_playing(caveAmbience1)) {
			audio_stop_sound(caveAmbience1);
		}
		if (audio_is_playing(caveAmbience2)) {
			audio_stop_sound(caveAmbience2);
		}
		if (audio_is_playing(caveAmbience3)) {
			audio_stop_sound(caveAmbience3);
		}
		if (audio_is_playing(caveAmbience4)) {
			audio_stop_sound(caveAmbience4);
		}
		
		if (audio_is_playing(nuclidesL1_msc)) {
			audio_stop_sound(nuclidesL1_msc);
		}
		if (audio_is_playing(nuclidesL2_msc)) {
			audio_stop_sound(nuclidesL2_msc);
		}
		if (audio_is_playing(nuclidesL3_msc)) {
			audio_stop_sound(nuclidesL3_msc);
		}
		
		if (audio_is_playing(feastL1_msc)) {
			audio_stop_sound(feastL1_msc);
		}
		if (audio_is_playing(feastL2_msc)) {
			audio_stop_sound(feastL2_msc);
		}
		
		if (audio_is_playing(sliceCom_msc)) {
			audio_stop_sound(sliceCom_msc);
		}
		if (audio_is_playing(sliceExp_msc)) {
			audio_stop_sound(sliceExp_msc);
		}

	}
} else {
	if (audio_is_playing(powerplant_msc)) {
		audio_stop_sound(powerplant_msc);
	}
}

//Casino Theme
if (room == level_Casino || room == mainmenu || room == levelSelect || room == storySelect || room == worldmap || room == settings || room == upgrademenu || room == level_DiningHall || room == level_TristramRoom) {
	if (!audio_is_playing(casinoTheme)) {
		audio_play_sound_on(musicEmitter, casinoTheme, 1, 1);
		
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
		
		if (audio_is_playing(birchL1_msc)) {
			audio_stop_sound(birchL1_msc);
		}
		if (audio_is_playing(birchL2_msc)) {
			audio_stop_sound(birchL2_msc);
		}
		if (audio_is_playing(birchL3_msc)) {
			audio_stop_sound(birchL3_msc);
		}
		
		if (audio_is_playing(caveAmbience1)) {
			audio_stop_sound(caveAmbience1);
		}
		if (audio_is_playing(caveAmbience2)) {
			audio_stop_sound(caveAmbience2);
		}
		if (audio_is_playing(caveAmbience3)) {
			audio_stop_sound(caveAmbience3);
		}
		if (audio_is_playing(caveAmbience4)) {
			audio_stop_sound(caveAmbience4);
		}
		
		if (audio_is_playing(nuclidesL1_msc)) {
			audio_stop_sound(nuclidesL1_msc);
		}
		if (audio_is_playing(nuclidesL2_msc)) {
			audio_stop_sound(nuclidesL2_msc);
		}
		if (audio_is_playing(nuclidesL3_msc)) {
			audio_stop_sound(nuclidesL3_msc);
		}
		
		if (audio_is_playing(feastL1_msc)) {
			audio_stop_sound(feastL1_msc);
		}
		if (audio_is_playing(feastL2_msc)) {
			audio_stop_sound(feastL2_msc);
		}
		
		if (audio_is_playing(sliceCom_msc)) {
			audio_stop_sound(sliceCom_msc);
		}
		if (audio_is_playing(sliceExp_msc)) {
			audio_stop_sound(sliceExp_msc);
		}

	}
} else {
	if (audio_is_playing(casinoTheme)) {
		audio_stop_sound(casinoTheme);
	}
}

//Casino Low Pass Theme
if (room == blackjackTable || room == level_CasinoRoof) {
	if (!audio_is_playing(casinoThemeLowPass)) {
		audio_play_sound_on(musicEmitter, casinoThemeLowPass, 1, 1);
	}
	if (audio_is_playing(casinoTheme)) {
		audio_stop_sound(casinoTheme);
	}
} else {
	if (audio_is_playing(casinoThemeLowPass)) {
		audio_stop_sound(casinoThemeLowPass);
	}
}


//ACT1 WORLD MUSIC
if (room == level0 || room == level1 || room == level2 || room == level3 || room == warpzone1 || room == warpzone2 || room == warpzone3) {
	act1MusicOn = true;
} else {
	act1MusicOn = false;
	act1MusicStarted = false;
}

if (act1MusicOn && !act1MusicStarted) {
	parediaSTEM = audio_play_sound_on(musicEmitter, dressedToKillSTEM, 1, 1);
	parediaL3 = audio_play_sound_on(musicEmitter, dressedToKillL3, 1, 1);
	parediaL2 = audio_play_sound_on(musicEmitter, dressedToKillL2, 1, 1);
	parediaL1 = audio_play_sound_on(musicEmitter, dressedToKillL1, 1, 1);
	
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
		} else if (place_meeting(x, y, musicBoxAmbience2_obj)) {
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
		} else if (place_meeting(x, y, musicBoxFastAmbience_obj)) {
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
		} else if (place_meeting(x, y, musicBoxFastAmbience2_obj)) {
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
		} else if (place_meeting(x, y, musicBoxBattle_obj)) {
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
		} else if (place_meeting(x, y, musicBoxBattleBig_obj)) {
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
		} else if (place_meeting(x, y, musicBoxSilence_obj)) {
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
if (room == level4 || room == level5A || room == level5B || room == level6 || room == level7 || room == level8 || room == level9) {
	act2MusicOn = true;
} else {
	act2MusicOn = false;
	act2MusicStarted = false;
}

if (act2MusicOn && !act2MusicStarted) {
	forestL1 = audio_play_sound_on(musicEmitter, birchL1, 1, 1);
	forestL2 = audio_play_sound_on(musicEmitter, birchL2, 1, 1);
	forestL3 = audio_play_sound_on(musicEmitter, birchL3, 1, 1);
	
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
	
	audio_sound_gain(forestL1, 0, 0);
	audio_sound_gain(forestL2, 0, 0);
	audio_sound_gain(forestL3, 0, 0);
	
	act2MusicStarted = true;
}

if (act2MusicOn && act2MusicStarted) {
	with (player_obj) {	
		if (place_meeting(x, y, musicBoxAmbience_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(forestL2) == 0) {
					audio_sound_gain(forestL2, 1, 300);
				}
				audio_sound_gain(forestL1, 0, 300);
				audio_sound_gain(forestL3, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxAmbience2_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(forestL3) == 0) {
					audio_sound_gain(forestL3, 1, 300);
				}
				audio_sound_gain(forestL1, 0, 300);
				audio_sound_gain(forestL2, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxBattleBig_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(forestL1) == 0) {
					audio_sound_gain(forestL1, 1, 300);
				}
				audio_sound_gain(forestL2, 0, 300);
				audio_sound_gain(forestL3, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxSilence_obj)) {
			with (musicManager_obj) {
				audio_sound_gain(forestL1, 0, 300);
				audio_sound_gain(forestL2, 0, 300);
				audio_sound_gain(forestL3, 0, 300);
			}
		}
	}
}

//ACT3 WORLD MUSIC
if (room == level10 || room == level11 || room == level12 || room == level13 || room == level14) {
	act3MusicOn = true;
} else {
	act3MusicOn = false;
	act3MusicStarted = false;
}

if (act3MusicOn && !act3MusicStarted) {
	caveL1 = audio_play_sound_on(musicEmitter, caveAmbience1, 1, 1);
	caveL2 = audio_play_sound_on(musicEmitter, caveAmbience2, 1, 1);
	caveL3 = audio_play_sound_on(musicEmitter, caveAmbience3, 1, 1);
	caveL4 = audio_play_sound_on(musicEmitter, caveAmbience4, 1, 1);
	feastL1Track = audio_play_sound_on(musicEmitter, feastL1, 1, 1);
	feastL2Track = audio_play_sound_on(musicEmitter, feastL2, 1, 1);
	
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
	
	audio_sound_gain(caveL1, 0, 0);
	audio_sound_gain(caveL2, 0, 0);
	audio_sound_gain(caveL3, 0, 0);
	audio_sound_gain(caveL4, 0, 0);
	audio_sound_gain(feastL1Track, 0, 0);
	audio_sound_gain(feastL2Track, 0, 0);
	
	act3MusicStarted = true;
}

if (act3MusicOn && act3MusicStarted) {
	with (player_obj) {	
		if (place_meeting(x, y, musicBoxAmbience_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(caveL1) == 0) {
					audio_sound_gain(caveL1, 1, 300);
				}
				if (audio_sound_get_gain(caveL2) == 0) {
					audio_sound_gain(caveL2, 1, 300);
				}
				if (audio_sound_get_gain(caveL3) == 0) {
					audio_sound_gain(caveL3, 1, 300);
				}
				if (audio_sound_get_gain(caveL4) == 0) {
					audio_sound_gain(caveL4, 1, 300);
				}
				audio_sound_gain(feastL1Track, 0, 300);
				audio_sound_gain(feastL2Track, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxAmbience2_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(feastL1Track) == 0) {
					audio_sound_gain(feastL1Track, 1, 300);
				}
				audio_sound_gain(caveL1, 0, 300);
				audio_sound_gain(caveL2, 0, 300);
				audio_sound_gain(caveL3, 0, 300);
				audio_sound_gain(caveL4, 0, 300);
				audio_sound_gain(feastL2Track, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxBattle_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(feastL2Track) == 0) {
					audio_sound_gain(feastL2Track, 1, 300);
				}
				audio_sound_gain(caveL1, 0, 300);
				audio_sound_gain(caveL2, 0, 300);
				audio_sound_gain(caveL3, 0, 300);
				audio_sound_gain(caveL4, 0, 300);
				audio_sound_gain(feastL1Track, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxBattleBig_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(feastL1Track) == 0) {
					audio_sound_gain(feastL1Track, 1, 300);
				}
				if (audio_sound_get_gain(feastL2Track) == 0) {
					audio_sound_gain(feastL2Track, 1, 300);
				}
				
				audio_sound_gain(caveL1, 0, 300);
				audio_sound_gain(caveL2, 0, 300);
				audio_sound_gain(caveL3, 0, 300);
				audio_sound_gain(caveL4, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxSilence_obj)) {
			with (musicManager_obj) {
				audio_sound_gain(caveL1, 0, 300);
				audio_sound_gain(caveL2, 0, 300);
				audio_sound_gain(caveL3, 0, 300);
				audio_sound_gain(caveL3, 0, 300);
				audio_sound_gain(feastL1Track, 0, 300);
				audio_sound_gain(feastL2Track, 0, 300);
			}
		}
	}
}

//ACT4 WORLD MUSIC
if (room == level15 || room == level16 || room == level17 || room == level18 || room == level19) {
	act4MusicOn = true;
} else {
	act4MusicOn = false;
	act4MusicStarted = false;
}

if (act4MusicOn && !act4MusicStarted) {
	atomicL1 = audio_play_sound_on(musicEmitter, nuclidesL1, 1, 1);
	atomicL2 = audio_play_sound_on(musicEmitter, nuclidesL2, 1, 1);
	atomicL3 = audio_play_sound_on(musicEmitter, nuclidesL3, 1, 1);
	
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
	
	audio_sound_gain(atomicL3, 0, 0);
	audio_sound_gain(atomicL2, 0, 0);
	audio_sound_gain(atomicL1, 0, 0);
	
	act4MusicStarted = true;
}

if (act4MusicOn && act4MusicStarted) {
	with (player_obj) {
		if (place_meeting(x, y, musicBoxSilence_obj)) {
			with (musicManager_obj) {
				audio_sound_gain(atomicL3, 0, 300);
				audio_sound_gain(atomicL2, 0, 300);
				audio_sound_gain(atomicL1, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxAmbience_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(atomicL2) == 0) {
					audio_sound_gain(atomicL2, 1, 300);
				}
				audio_sound_gain(atomicL3, 0, 300);
				audio_sound_gain(atomicL1, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxFastAmbience_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(atomicL1) == 0) {
					audio_sound_gain(atomicL1, 1, 300);
				}
				audio_sound_gain(atomicL2, 0, 300);
				audio_sound_gain(atomicL3, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxBattle_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(atomicL3) == 0) {
					audio_sound_gain(atomicL3, 1, 300);
				}
				audio_sound_gain(atomicL1, 0, 300);
				audio_sound_gain(atomicL2, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxFastAmbience2_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(atomicL1) == 0) {
					audio_sound_gain(atomicL1, 1, 300);
				}
				if (audio_sound_get_gain(atomicL3) == 0) {
					audio_sound_gain(atomicL3, 1, 300);
				}
				audio_sound_gain(atomicL2, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxBattleBig_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(atomicL1) == 0) {
					audio_sound_gain(atomicL1, 1, 300);
				}
				if (audio_sound_get_gain(atomicL2) == 0) {
					audio_sound_gain(atomicL2, 1, 300);
				}
				if (audio_sound_get_gain(atomicL3) == 0) {
					audio_sound_gain(atomicL3, 1, 300);
				}
			}
		}
	}
}

//ACT5 WORLD MUSIC
if (room == level20) {
	act5MusicOn = true;
} else {
	act5MusicOn = false;
	act5MusicStarted = false;
}

if (act5MusicOn && !act5MusicStarted) {
	sliceDiceCom = audio_play_sound_on(musicEmitter, sliceCom, 1, 1);
	sliceDiceExp = audio_play_sound_on(musicEmitter, sliceExp, 1, 1);
	
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
	
	audio_sound_gain(sliceDiceCom, 0, 0);
	audio_sound_gain(sliceDiceExp, 0, 0);
	
	act5MusicStarted = true;
}

if (act5MusicOn && act5MusicStarted) {
	with (player_obj) {
		if (place_meeting(x, y, musicBoxSilence_obj)) {
			with (musicManager_obj) {
				audio_sound_gain(sliceDiceCom, 0, 300);
				audio_sound_gain(sliceDiceExp, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxBattle_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(sliceDiceExp) == 0) {
					audio_sound_gain(sliceDiceExp, 1, 300);
				}
				audio_sound_gain(sliceDiceCom, 0, 300);
			}
		} else if (place_meeting(x, y, musicBoxBattleBig_obj)) {
			with (musicManager_obj) {
				if (audio_sound_get_gain(sliceDiceCom) == 0) {
					audio_sound_gain(sliceDiceCom, 1, 300);
				}
				audio_sound_gain(sliceDiceExp, 0, 300);
			}
		}
	}
}