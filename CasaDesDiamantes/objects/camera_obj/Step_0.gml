//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (keyboard_check_pressed(ord("J")))
{
	if (noHUD)
	{
		noHUD = false;
	}
	else
	{
		noHUD = true;
	}
}

if (showWindowMenu)
{
	if (keyboard_check_pressed(vk_escape) || mouse_check_button_pressed(mb_left))
	{
		dialogueLine++;
		showWindowMenu = false;
	}
}