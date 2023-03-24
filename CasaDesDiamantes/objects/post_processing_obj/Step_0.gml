if (global.pause) {
	ppfx_effect_set_enable(ppfx_id, PP_EFFECT.BLUR_GAUSSIAN, true);
} else {
	ppfx_effect_set_enable(ppfx_id, PP_EFFECT.BLUR_GAUSSIAN, false);
}