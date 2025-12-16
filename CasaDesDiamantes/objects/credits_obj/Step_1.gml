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