// Call it only once
ppfx_application_render_init();

// Create ppfx system
ppfx_id = ppfx_create();

// Create profile with all effects
var tutorialEffects = [
    new pp_bloom(true, 6, 0.5, 1.46, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.52, 1.08, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
	new pp_chromaber(true),
	new pp_blur_gaussian(true, 0.025),
];
tutorial_profile = ppfx_profile_create("Main", tutorialEffects);
var casinoEffects = [
    new pp_bloom(true, 6, 0.6, 1.19, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.68, 1.4, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
	new pp_blur_gaussian(true, 0.025),
];
casino_profile = ppfx_profile_create("Main", casinoEffects);
var act1Effects = [
    new pp_bloom(true, 6, 0.5, 1.46, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.65, 1.08, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
	new pp_blur_gaussian(true, 0.025),
];
act1_profile = ppfx_profile_create("Main", act1Effects);
var act2Effects = [
    new pp_bloom(true, 6, 0.4, 1.16, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.5, 1, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
	new pp_blur_gaussian(true, 0.025),
];
act2_profile = ppfx_profile_create("Main", act2Effects);

if (room == level_Casino) {
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