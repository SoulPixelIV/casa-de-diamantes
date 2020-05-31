if (window_get_width() != xScreenSize*2 && window_get_height() != yScreenSize*2)
{
	window_set_size(xScreenSize*2, yScreenSize*2);
	surface_resize(application_surface, xScreenSize, yScreenSize);
	display_set_gui_size(xScreenSize, yScreenSize);
}
