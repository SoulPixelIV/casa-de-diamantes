draw_self();

if (!global.warpzone2Done) {
	if (distance_to_object(player_obj) < 32 && global.hasWarpzoneKey)
	{
		draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	}
}