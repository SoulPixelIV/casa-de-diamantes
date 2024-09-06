application_surface_draw_enable(false);

// Create ppfx system
ppfx_id = new PPFX_System();

// Create profile with all effects
var pauseEffects = [
	new FX_Bloom(true, 6, 0.4, 1.27, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.3, 0.45, 1.2, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_GaussianBlur(true, 0.03),
	new FX_ChromaticAberration(true, 0),
];
pause_profile = new PPFX_Profile("Main", pauseEffects);
var overworldEffects = [
	new FX_Bloom(true, 6, 0.5, 0.43, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.3, 0.7, 0.34, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_ChromaticAberration(true, 0),
];
overworld_profile = new PPFX_Profile("Main", overworldEffects);
var menuEffects = [
	new FX_Bloom(true, 6, 0.5, 1.14, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.3, 0.33, 0.45, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_ChromaticAberration(true, 0),
];
menu_profile = new PPFX_Profile("Main", menuEffects);
var blackjackEffects = [
	new FX_Bloom(true, 6, 0.5, 0.85, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.27, 0.76, 0.45, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_ChromaticAberration(true, 0),
];
blackjack_profile = new PPFX_Profile("Main", blackjackEffects);
var creditsEffects = [
	new FX_Bloom(true, 6, 0.5, 1.18, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.3, 0.43, 0.45, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_NoiseGrain(true, 0.5),
	new FX_ChromaticAberration(true, 0),
];
credits_profile = new PPFX_Profile("Main", creditsEffects);
var tutorialEffects = [
	new FX_Bloom(true, 6, 0.5, 1.2, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.3, 0.35, 1.08, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_ChromaticAberration(true),
];
tutorial_profile = new PPFX_Profile("Main", tutorialEffects);
var casinoEffects = [
	new FX_Bloom(true, 6, 0.6, 1.2, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.3, 0.18, 1.4, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_ChromaticAberration(true, 0),
];
casino_profile = new PPFX_Profile("Main", casinoEffects);
var act1Effects = [
	new FX_Bloom(true, 6, 0.5, 1.3, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.4, 0.35, 1.08, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_ChromaticAberration(true, 0),
];
act1_profile = new PPFX_Profile("Main", act1Effects);
var act2Effects = [
	new FX_Bloom(true, 6, 0.7, 1.3, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.4, 0.35, 0.9, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_ChromaticAberration(true, 0),
];
act2_profile = new PPFX_Profile("Main", act2Effects);
var act3Effects = [
	new FX_Bloom(true, 6, 0.7, 1.3, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.4, 0.35, 0.9, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_ChromaticAberration(true, 0),
];
act3_profile = new PPFX_Profile("Main", act3Effects);
var act4Effects = [
	new FX_Bloom(true, 4, 0.5, 1.23, c_white, 0.3, true, undefined, 0.8, 1, true),
	new FX_SunShafts(true, [0.5, 0.5], 0.4, 0.2, 1.08, 1.6, 0.4, true, 0.7, 0.05, 0.15),
	new FX_ChromaticAberration(true, 0),
];
act4_profile = new PPFX_Profile("Main", act4Effects);

if (room == mainmenu || room == levelSelect || room == storySelect || room == demoend || room == settings || room == upgrademenu || room == blimpAnim || room == blimpAnim2) {
	ppfx_id.ProfileLoad(menu_profile);
} else if (room == blackjackTable) {
	ppfx_id.ProfileLoad(blackjack_profile);
} else if (room == credits || room == cutscene1) {
	ppfx_id.ProfileLoad(credits_profile);
} else if (room == worldmap) {
	ppfx_id.ProfileLoad(overworld_profile);
} else if (room == level_Casino || room == level_DiningHall || room == level_TristramRoom || room == level_Basement) {
	ppfx_id.ProfileLoad(casino_profile);
} else if (room == level_CasinoRoof) {
	ppfx_id.ProfileLoad(act1_profile);
} else if (room == level0 || room == warpzone1 || room == warpzone2) {
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
} else if (room == level15) {
	ppfx_id.ProfileLoad(act2_profile);
} else if (room == level16) {
	ppfx_id.ProfileLoad(act4_profile);
}