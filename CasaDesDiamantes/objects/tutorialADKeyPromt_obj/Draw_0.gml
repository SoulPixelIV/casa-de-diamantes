if (triggerText) {
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(player_obj.x + 76, player_obj.y - 64, "Press WASD to Move");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(player_obj.x + 76, player_obj.y - 64, "Press WASD to Move");
	draw_set_halign(fa_left);
}


