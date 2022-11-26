shake_fx = fx_create("_filter_fractal_noise");
fx_set_single_layer(shake_fx, true);

fx_set_parameter(shake_fx, "g_FractalNoiseSpeed", 0.3);
fx_set_parameter(shake_fx, "g_FractalNoiseScale", 60);
fx_set_parameter(shake_fx, "g_FractalNoiseColour", [1,0,0.5, 1]);

layer_set_fx("ToxicClouds", shake_fx);


