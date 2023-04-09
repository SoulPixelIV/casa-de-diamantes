// Call it only once
ppfx_application_render_init();

// Create ppfx system
ppfx_id = ppfx_create();

// Create profile with all effects
var pauseEffects = [
    new pp_bloom(true, 6, 0.4, 1.3, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.5, 1.2, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
	new pp_blur_gaussian(true, 0.03),
];
pause_profile = ppfx_profile_create("Main", pauseEffects);
var overworldEffects = [
    new pp_bloom(true, 6, 0.5, 0.5, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.8, 0.34, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
];
overworld_profile = ppfx_profile_create("Main", overworldEffects);
var menuEffects = [
    new pp_bloom(true, 6, 0.5, 1.33, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.8, 0.45, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
];
menu_profile = ppfx_profile_create("Main", menuEffects);
var creditsEffects = [
    new pp_bloom(true, 6, 0.5, 1.33, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.8, 0.45, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
	new pp_noise_grain(true, 0.05),
];
credits_profile = ppfx_profile_create("Main", creditsEffects);
var tutorialEffects = [
    new pp_bloom(true, 6, 0.5, 1.46, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.52, 1.08, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
	new pp_chromaber(true),
];
tutorial_profile = ppfx_profile_create("Main", tutorialEffects);
var casinoEffects = [
    new pp_bloom(true, 6, 0.6, 1.19, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.68, 1.4, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
];
casino_profile = ppfx_profile_create("Main", casinoEffects);
var act1Effects = [
    new pp_bloom(true, 6, 0.5, 1.46, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.65, 1.08, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
];
act1_profile = ppfx_profile_create("Main", act1Effects);
var act2Effects = [
    new pp_bloom(true, 6, 0.4, 1.16, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.5, 1, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
];
act2_profile = ppfx_profile_create("Main", act2Effects);


if (room == mainmenu || room == levelSelect || room == demoend) {
	ppfx_profile_load(ppfx_id, menu_profile);
} else if (room == credits) {
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
}