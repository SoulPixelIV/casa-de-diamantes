if (triggerText) {
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(player_obj.x + 104, player_obj.y - 64, "Press Space to Jump");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(player_obj.x + 104, player_obj.y - 64, "Press Space to Jump");
	
	draw_set_color(c_black);
	draw_text(player_obj.x + 104, player_obj.y - 48, "Press Space 2x to Doublejump");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(player_obj.x + 104, player_obj.y - 48, "Press Space 2x to Doublejump");
	draw_set_halign(fa_left);
}


