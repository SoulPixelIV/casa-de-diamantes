// Create system
layer_effects_id = ppfx_create();

// Create profile with effects
var _profile_test = ppfx_profile_create("Cool Layer Effects", [
    new pp_sine_wave(true, 0.5, [0.005, 0.005], [30, 30]),
    new pp_sunshafts(true, [0.5, 0.5], 0.3, 0.5, 3, 1, 0.3, true, 1, 0.08, 0.8, false),
]);

// Load profile
ppfx_profile_load(layer_effects_id, _profile_test);

layer_index = ppfx_layer_create();
ppfx_layer_apply(layer_effects_id, layer_index, layer_get_id("Instances"), layer_get_id("Background2"), true);
