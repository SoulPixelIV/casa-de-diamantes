if (ppfx_system_exists(ppfx_id)) {
	if (global.pause) {
		ppfx_id.ProfileLoad(pause_profile);
	} else {
		if (room == mainmenu || room == levelSelect || room == storySelect || room == demoend || room == settings || room == upgrademenu || room == blimpAnim) {
			ppfx_id.ProfileLoad(menu_profile);
		} else if (room == blackjackTable) {
			ppfx_id.ProfileLoad(blackjack_profile);
		} else if (room == credits || room == cutscene1) {
			ppfx_id.ProfileLoad(credits_profile);
		} else if (room == worldmap) {
			ppfx_id.ProfileLoad(overworld_profile);
		} else if (room == level_Casino) {
			ppfx_id.ProfileLoad(casino_profile);
		} else if (room == level_CasinoRoof) {
			ppfx_id.ProfileLoad(act1_profile);
		} else if (room == level0) {
			ppfx_id.ProfileLoad(tutorial_profile);
		} else if (room == level1) {
			ppfx_id.ProfileLoad(act1_profile);
		} else if (room == level2) {
			ppfx_id.ProfileLoad(act1_profile);
		} else if (room == level3) {
			ppfx_id.ProfileLoad(act1_profile);
		} else if (room == level4) {
			ppfx_id.ProfileLoad(act2_profile);
		} else if (room == level5A) {
			ppfx_id.ProfileLoad(act2_profile);
		} else if (room == level5B) {
			ppfx_id.ProfileLoad(act2_profile);
		} else if (room == warpzone1) {
			ppfx_id.ProfileLoad(tutorial_profile);
		} else if (room == warpzone2) {
			ppfx_id.ProfileLoad(tutorial_profile);
		} else if (room == level6) {
			ppfx_id.ProfileLoad(act2_profile);
		} else if (room == level7) {
			ppfx_id.ProfileLoad(act2_profile);
		} else if (room == level8) {
			ppfx_id.ProfileLoad(act2_profile);
		} else if (room == level9) {
			ppfx_id.ProfileLoad(act2_profile);
		} else if (room == level10) {
			ppfx_id.ProfileLoad(act3_profile);
		} else if (room == level11) {
			ppfx_id.ProfileLoad(act3_profile);
		} else if (room == level12) {
			ppfx_id.ProfileLoad(act3_profile);
		} else if (room == level13) {
			ppfx_id.ProfileLoad(act3_profile);
		} else if (room == level14) {
			ppfx_id.ProfileLoad(act2_profile);
		}
	}
	
	//Chromatic Filter
	if (room != warpzone1 && room != warpzone2) {
		ppfx_id.SetEffectParameter(FX_EFFECT.CHROMATIC_ABERRATION, PP_CHROMABER_INTENSITY, global.chromaticLevel);
	}
}