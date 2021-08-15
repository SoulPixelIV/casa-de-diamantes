/// @description Draw Key
draw_self();

if (distance_to_object(player_obj) < 32 && !used)
{
	draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	sprite_index = leverOutline_spr;
}
else
{
	if (used)
	{
		sprite_index = leverOn_spr;
	}
	else
	{
		sprite_index = leverOff_spr;
	}
}