// Call it only once
ppfx_application_render_init();

// Create ppfx system
ppfx_id = ppfx_create();

// Create profile with all effects
var level3Effects = [
    new pp_bloom(true, 6, 0.5, 1.63, c_white, true, undefined, 0.8, 1, true, true),
	new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.6, 1.15, 1.6, 0.4, true, 1, 0.05, 0.8, false, undefined, undefined),
];
main_profile = ppfx_profile_create("Main", level3Effects);

// Load profile, so all effects will be used
if (room == level3) {
	ppfx_profile_load(ppfx_id, main_profile);
}