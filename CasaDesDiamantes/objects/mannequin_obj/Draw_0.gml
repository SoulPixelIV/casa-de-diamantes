/// @description Draw Key
draw_self();

if (distance_to_object(player_obj) < 32 && !global.boughtSkin1)
{
	if (player_obj.inputMethod == 0) {
		draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	} else {
		draw_sprite(joystick_spr, 0, player_obj.x, player_obj.y - 32);
	}
	sprite_index = mannequinOutline_spr;
}
else
{
	if (global.skin == 1)
	{
		sprite_index = mannequin_spr;
		image_index = 0;
	}
	else
	{
		sprite_index = mannequin_spr;
		image_index = 1;
	}
}