/// @description Shortcuts

ideal_delta_time = 1000000 / room_speed;
global.dt = clamp((delta_time / ideal_delta_time) * global.timeScale, 0.1, 5000);
global.dtNoSlowmo = delta_time / ideal_delta_time;

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
global.ambientShadowIntensity = 0.65 * global.gamma;

