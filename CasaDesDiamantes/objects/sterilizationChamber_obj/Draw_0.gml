/// @description Draw Key
draw_self();

if (distance_to_object(player_obj) < 32 && !sterilization && player_obj.plagueTransformation)
{
	if (player_obj.inputMethod == 0) {
		draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	} else {
		draw_sprite(joystick_spr, 0, player_obj.x, player_obj.y - 32);
	}
	sprite_index = sterilizationChamberOutline_spr;
} else {
	sprite_index = sterilizationChamber_spr;
}