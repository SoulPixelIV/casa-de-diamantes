if (blackJackCalc_obj.screen == 0)
{
	draw_sprite(sprite_index, 0, x, y);
	draw_set_font(global.optixFontHuge);
	draw_text_ext(x + 16, y + 16, text, 3, 70);
}
