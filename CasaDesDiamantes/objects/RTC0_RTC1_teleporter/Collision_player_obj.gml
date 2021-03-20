if (instance_exists(player_obj))
{
	if (player_obj.key_up_pressed && open)
	{
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		room_goto(level1_RoadToCasino);
	}
}
