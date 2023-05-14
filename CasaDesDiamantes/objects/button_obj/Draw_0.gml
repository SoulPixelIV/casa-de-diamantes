if (blackJackCalc_obj.screen == 2) {
	if (hit || stand)
	{
		if (blackJackCalc_obj.screen == 1)
		{
			draw_sprite(sprite_index, 0, x, y);
			draw_set_font(gothicPixel_fnt);
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			draw_text(x - 1, y - 7, text);
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(x, y - 8, text);
		}
	}
	else if (back)
	{
		if (blackJackCalc_obj.screen == 2)
		{
			draw_sprite(sprite_index, 0, x, y);
			draw_set_font(gothicPixel_fnt);
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			draw_text(x - 1, y - 7, text);
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(x, y - 8, text);
		}
	}
	else if (blackJackCalc_obj.screen == 0)
	{
		draw_sprite(sprite_index, 0, x, y);
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(x - 1, y - 7, text);
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(x, y - 8, text);
	}
}
