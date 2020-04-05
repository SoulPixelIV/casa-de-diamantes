/// @description Draw Key
draw_self();

if (distance_to_object(player_obj) < 32)
{
	draw_sprite(fKeyIcon_spr, 0, x, y - 32);
}