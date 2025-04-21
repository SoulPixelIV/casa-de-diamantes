/// @description Draw Key
draw_self();

if (elevatorNumber != 0) {
	if (distance_to_object(player_obj) < 32 && !used)
	{	
		if (player_obj.inputMethod == 0) {
			draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
		} else {
			draw_sprite(joystick_spr, 0, player_obj.x, player_obj.y - 32);
		}
	}
}