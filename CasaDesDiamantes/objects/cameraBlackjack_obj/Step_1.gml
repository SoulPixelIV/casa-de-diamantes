if (window_get_width() != xScreenSize*3 && window_get_height() != yScreenSize*3)
{
	window_set_size(xScreenSize*3, yScreenSize*3);
	surface_resize(application_surface, xScreenSize, yScreenSize);
	display_set_gui_size(xScreenSize, yScreenSize);
}
