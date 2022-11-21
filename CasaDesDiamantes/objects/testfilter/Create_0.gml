shake_fx = fx_create("_filter_large_blur");
fx_set_single_layer(shake_fx, true);

fx_set_parameter(shake_fx, "g_Radius", 0.6);

layer_set_fx("Test", shake_fx);


