draw_self();
if (distance_to_object(player_obj) < 32)
{
	image_index = 1;
	draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
} else {
	image_index = 0;
}