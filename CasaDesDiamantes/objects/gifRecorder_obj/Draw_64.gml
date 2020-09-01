if (gifRecorder)
{
	draw_set_font(global.optixFont);
	draw_set_color(c_red);
	draw_text(camera_obj.xScreenSize / 2 - 64, camera_obj.edgeMarginVer, "RECORDING GIF!");
}
