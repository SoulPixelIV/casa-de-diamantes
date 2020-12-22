//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//Change zoom
xWindowSize = xScreenSize * zoom;
yWindowSize = yScreenSize * zoom;

if (keyboard_check_pressed(ord("O")))
{
	window_center();
	if (zoom < 8)
	{
		zoom += 2;
	}
	else
	{
		zoom = 2;
	}
}