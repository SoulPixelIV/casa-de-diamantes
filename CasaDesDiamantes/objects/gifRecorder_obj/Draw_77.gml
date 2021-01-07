/*
if (keyboard_check_pressed(vk_f9))
{
	gifRecorder = !gifRecorder;
	
	if (gifRecorder)
	{
		gif = gif_open(camera_obj.xScreenSize, camera_obj.yScreenSize);
	}
	else
	{
		gif_save(gif, "record.gif");
	}
}
*/
if (gifRecorder)
{
	gif_add_surface(gif, application_surface, 2);
}
