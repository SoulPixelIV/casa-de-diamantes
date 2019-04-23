/// @description Draw Reflections

draw_self();

if (target > 0)
{
	for (var i = 0; i < target; i++)
	{
		if (reflectionList[| i] != water_obj && reflectionList[| i] != id)
		{
			draw_sprite_ext(reflectionList[| i].sprite_index, reflectionList[| i].image_index, reflectionList[| i].x, 
			reflectionList[| i].y + 40, reflectionList[| i].image_xscale, -0.75, 0, image_blend, 0.25);
		}
	}
}
/*
if (targetRealtime > 0)
{
	for (var i = 0; i < targetRealtime; i++)
	{
		draw_sprite_ext(reflectionListRealtime[| i].sprite_index, reflectionListRealtime[| i].image_index, reflectionListRealtime[| i].x, 
		reflectionListRealtime[| i].y + 54, reflectionListRealtime[| i].image_xscale, -0.75, 0, image_blend, 0.25);
	}
}
*/