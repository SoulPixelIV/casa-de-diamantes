/// @description Draw Key
draw_self();

if (distance_to_object(player_obj) < 82 && !camera_obj.drawText && player_obj.grounded && !global.komoGamblingDialogueDone)
{
	draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
}
