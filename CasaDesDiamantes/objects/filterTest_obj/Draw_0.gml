myEffect = fx_create("_filter_tintfilter");
fx_set_parameter(myEffect, "g_TintCol", [1, 0, 0, 1]);
fx_set_single_layer(myEffect, true);
layer_set_fx("Instances", myEffect);