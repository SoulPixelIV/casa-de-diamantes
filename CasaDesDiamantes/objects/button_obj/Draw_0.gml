if (blackJackCalc_obj.screen == 2) {
	if (bet50 || bet500 || start) {
		draw_sprite_ext(sprite_index, 0, x, y, sizeX, sizeY, 0, -1, 1);
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(x - 1, y - 3, text);
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(x, y - 4, text);
	}
}
if (blackJackCalc_obj.screen == 3) {	
	if (hit || stand) {
		draw_sprite_ext(sprite_index, 0, x, y, sizeX, sizeY, 0, -1, 1);
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(x - 1, y - 7, text);
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(x, y - 8, text);
	}
}
if (blackJackCalc_obj.screen == 4) {
	if (back) {
		draw_sprite_ext(sprite_index, 0, x, y, sizeX, sizeY, 0, -1, 1);
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(x - 1, y - 3, text);
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(x, y - 4, text);
	}
}