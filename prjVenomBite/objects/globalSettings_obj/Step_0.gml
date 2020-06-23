/// @description Shortcuts

ideal_delta_time = 1000000 / room_speed;
global.dt = clamp((delta_time / ideal_delta_time) * global.timeScale, 0.1, 5000);
global.dtNoSlowmo = delta_time / ideal_delta_time;

//Lock Cursor
if (!window_has_focus())
{
	display_mouse_unlock();
}
else
{
	if (window_get_fullscreen())
	{
		display_mouse_lock(x, y, window_get_width(), window_get_height());
	}
	else
	{
		display_mouse_lock(window_get_x(), window_get_y(), window_get_width(), window_get_height());
	}
}

if (keyboard_check_pressed(vk_f1))
{
	room_restart();
}

if (keyboard_check_pressed(vk_f11))
{
	global.gamma -= 0.1;
}
if (keyboard_check_pressed(vk_f12))
{
	global.gamma += 0.1;
}
if (room == level1_RoadToCasino || room == level0_RoadToCasino)
{
	global.ambientShadowIntensity = 0.45 * global.gamma;
}
else
{
	global.ambientShadowIntensity = 0.65 * global.gamma;
}
