if (window_get_fullscreen())
{
	if (window_get_width() != global.xScreenSize * zoom && window_get_height() != global.xScreenSize * zoom)
	{
		window_set_size(global.xScreenSize * zoom, global.yScreenSize * zoom);
		surface_resize(application_surface, global.xScreenSize, global.yScreenSize);
		display_set_gui_size(global.xScreenSize, global.yScreenSize);
		centeredWindow = false;
	}
}
else
{
	if (!centeredWindow) {
		//window_set_position(display_get_width() / 2, display_get_height() / 2);
		centeredWindow = true;
	}
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