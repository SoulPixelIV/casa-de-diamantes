/// @description Draw Key
draw_self();

if (distance_to_object(player_obj) < 32)
{
	draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	sprite_index = switchOutline_spr;
}
else
{
	if (used)
	{
		image_index = 1;
	}
	else
	{
		image_index = 0;
	}
}