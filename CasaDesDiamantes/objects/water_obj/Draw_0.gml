/// @description Draw Reflections

draw_self();

if (target > 0)
{
	for (var i = 0; i < target; i++)
	{
		if (reflectionList[| i].x < x + 32 && reflectionList[| i].x > x - 32)
		{
			draw_sprite_ext(reflectionList[| i].sprite_index, reflectionList[| i].image_index, reflectionList[| i].x, 
			y - 64 + (y - reflectionList[| i].y), reflectionList[| i].image_xscale, -1, 0, image_blend, 0.3);
		}
	}
}

if (targetRealtime > 0)
{
	for (var i = 0; i < targetRealtime; i++)
	{
		if (reflectionListRealtime[| i].x < x + 32 && reflectionListRealtime[| i].x > x - 32)
		{
			draw_sprite_ext(reflectionListRealtime[| i].sprite_index, reflectionListRealtime[| i].image_index, reflectionListRealtime[| i].x, 
			y - 64 + (y - reflectionListRealtime[| i].y), reflectionListRealtime[| i].image_xscale, -1, 0, image_blend, 0.3);
		}
	}
}