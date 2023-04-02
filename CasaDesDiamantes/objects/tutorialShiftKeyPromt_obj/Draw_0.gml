if (triggerText) {
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	
	if (instance_exists(player_obj)) {
		if (player_obj.inputMethod == 0) {
			draw_text(player_obj.x + 89, player_obj.y - 64, "Press Shift to Dash through Attacks");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(player_obj.x + 89, player_obj.y - 64, "Press Shift to Dash through Attacks");
		} else {
			draw_text(player_obj.x + 89, player_obj.y - 64, "Press Left Shoulder Trigger to Dash through Attacks");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(player_obj.x + 89, player_obj.y - 64, "Press Left Shoulder Trigger to Dash through Attacks");
		}
	}
	draw_set_halign(fa_left);
}


