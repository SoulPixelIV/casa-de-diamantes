if (ppfx_exists(ppfx_id)) {
	if (global.pause) {
		ppfx_profile_load(ppfx_id, pause_profile);
	} else {
		if (room == mainmenu || room == levelSelect || room == demoend || room == settings) {
			ppfx_profile_load(ppfx_id, menu_profile);
		} else if (room == blackjackTable) {
			ppfx_profile_load(ppfx_id, blackjack_profile);
		} else if (room == credits || room == cutscene1) {
			ppfx_profile_load(ppfx_id, credits_profile);
		} else if (room == worldmap) {
			ppfx_profile_load(ppfx_id, overworld_profile);
		} else if (room == level_Casino) {
			ppfx_profile_load(ppfx_id, casino_profile);
		} else if (room == level_CasinoRoof) {
			ppfx_profile_load(ppfx_id, act1_profile);
		} else if (room == level0) {
			ppfx_profile_load(ppfx_id, tutorial_profile);
		} else if (room == level1) {
			ppfx_profile_load(ppfx_id, act1_profile);
		} else if (room == level2) {
			ppfx_profile_load(ppfx_id, act1_profile);
		} else if (room == level3) {
			ppfx_profile_load(ppfx_id, act1_profile);
		} else if (room == level4) {
			ppfx_profile_load(ppfx_id, act2_profile);
		} else if (room == level5A) {
			ppfx_profile_load(ppfx_id, act2_profile);
		} else if (room == level5B) {
			ppfx_profile_load(ppfx_id, act2_profile);
		} else if (room == level6) {
			ppfx_profile_load(ppfx_id, act2_profile);
		} else if (room == level7) {
			ppfx_profile_load(ppfx_id, act2_profile);
		} else if (room == level8) {
			ppfx_profile_load(ppfx_id, act2_profile);
		}
	}
}