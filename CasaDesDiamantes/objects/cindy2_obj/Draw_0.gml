/// @description Draw Key
draw_self();
if (distance_to_object(player_obj) < 32 && !camera_obj.drawText)
{
	draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
}
