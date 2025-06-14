if (window_get_fullscreen())
{
	if (window_get_width() != xScreenSize * zoom && window_get_height() != yScreenSize * zoom)
	{
		window_set_size(xWindowSize * zoom, yWindowSize * zoom);
		surface_resize(application_surface, xScreenSize, yScreenSize);
		display_set_gui_size(xScreenSize, yScreenSize);
	}
}
else
{
	//window_set_position(display_get_width() / 2 - xScreenSize * zoom, display_get_height() / 2 - yScreenSize * zoom);
}

/*
if (keyboard_check_pressed(ord("P")))
{
	if (zoom == 1)
	{
		zoom = 2;
	}
	else
	{
		zoom = 1;
	}
}*/

if (drawStartMenu) {
	if (keyboard_check_pressed(vk_escape)) {
		drawStartMenu = false;
	}
}