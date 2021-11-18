/// @description Draw Key
draw_self();

if (distance_to_object(player_obj) < 32 && !used)
{	
	if ((elevatorNumber == 1 && !global.pwlevel2UnlockedElevator) || (elevatorNumber == 3 && !global.pwlevel3UnlockedElevator)) {
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(player_obj.x - 1, player_obj.y - 38 + 1, "Elevator locked");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(player_obj.x, player_obj.y - 38, "Elevator locked");
		draw_set_halign(fa_left);
	} else {
		draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	}
}