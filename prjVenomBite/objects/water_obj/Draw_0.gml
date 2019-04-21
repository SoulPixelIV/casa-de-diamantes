/// @description Draw Player Reflection

draw_self();

var reflectionListNear = ds_list_create();
var reflectionListMedium = ds_list_create();
var reflectionListFar = ds_list_create();

targetNear = instance_position_list(x, y - 8, all, reflectionListNear, false);
targetMedium = instance_position_list(x, y - 16, all, reflectionListMedium, false);
targetFar = instance_position_list(x, y - 32, all, reflectionListFar, false);

if (targetNear > 0)
{
	for (var i = 0; i < targetNear; i++)
	{
		draw_sprite_ext(reflectionListNear[| i].sprite_index, reflectionListNear[| i].image_index, reflectionListNear[| i].x, 
		reflectionListNear[| i].y + 36, reflectionListNear[| i].image_xscale, -0.75 , 0, image_blend, 0.25);
	}
}

if (targetMedium > 0)
{
	for (var i = 0; i < targetMedium; i++)
	{
		draw_sprite_ext(reflectionListMedium[| i].sprite_index, reflectionListMedium[| i].image_index, reflectionListMedium[| i].x, 
		reflectionListMedium[| i].y + 36, reflectionListMedium[| i].image_xscale, -0.75 , 0, image_blend, 0.25);
	}
}

if (targetFar > 0)
{
	for (var i = 0; i < targetFar; i++)
	{
		draw_sprite_ext(reflectionListFar[| i].sprite_index, reflectionListFar[| i].image_index, reflectionListFar[| i].x, 
		reflectionListFar[| i].y + 36, reflectionListFar[| i].image_xscale, -0.75 , 0, image_blend, 0.25);
	}
}


