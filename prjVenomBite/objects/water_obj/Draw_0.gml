/// @description Draw Player Reflection

draw_self();

if (target > 0)
{
	for (var i = 0; i < target; i++)
	{
		if (reflectionList[| i] != water_obj && reflectionList[| i] != id)
		{
			draw_sprite_ext(reflectionList[| i].sprite_index, reflectionList[| i].image_index, reflectionList[| i].x, 
			reflectionList[| i].y + 40, reflectionList[| i].image_xscale, -1, 0, image_blend, 0.25);
		}
	}
}

//Realtime

targetRealtime = instance_position_list(x, y - 8, player_obj, reflectionListRealtime, false) + 
instance_position_list(x, y - 16, player_obj, reflectionListRealtime, false) + 
instance_position_list(x, y - 32, player_obj, reflectionListRealtime, false) +

instance_position_list(x + 8, y - 8, player_obj, reflectionListRealtime, false) + 
instance_position_list(x + 8, y - 16, player_obj, reflectionListRealtime, false) + 
instance_position_list(x + 8, y - 32, player_obj, reflectionListRealtime, false) +

instance_position_list(x + 16, y - 8, player_obj, reflectionListRealtime, false) + 
instance_position_list(x + 16, y - 16, player_obj, reflectionListRealtime, false) + 
instance_position_list(x + 16, y - 32, player_obj, reflectionListRealtime, false) +

instance_position_list(x - 8, y - 8, player_obj, reflectionListRealtime, false) + 
instance_position_list(x - 8, y - 16, player_obj, reflectionListRealtime, false) + 
instance_position_list(x - 8, y - 32, player_obj, reflectionListRealtime, false) +

instance_position_list(x - 16, y - 8, player_obj, reflectionListRealtime, false) + 
instance_position_list(x - 16, y - 16, player_obj, reflectionListRealtime, false) + 
instance_position_list(x - 16, y - 32, player_obj, reflectionListRealtime, false);

if (targetRealtime > 0)
{
	for (var i = 0; i < targetRealtime; i++)
	{
		draw_sprite_ext(reflectionListRealtime[| i].sprite_index, reflectionListRealtime[| i].image_index, reflectionListRealtime[| i].x, 
		reflectionListRealtime[| i].y + 44, reflectionListRealtime[| i].image_xscale, -1, 0, image_blend, 0.25);
	}
}
