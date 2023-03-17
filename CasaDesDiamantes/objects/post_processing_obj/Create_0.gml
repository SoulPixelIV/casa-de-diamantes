layer_effects_id = ppfx_create();

var _profile_test = ppfx_profile_create("Main", [
    new pp_bloom(true, 5, 0.3, 4, c_white, true, undefined, 2.5, 1, true, true, false)
]);

ppfx_profile_load(layer_effects_id, _profile_test);

layer_index = ppfx_layer_create();
ppfx_layer_apply(layer_effects_id, layer_index, layer_get_id("GPUFilter"), layer_get_id("Background2"), false);
