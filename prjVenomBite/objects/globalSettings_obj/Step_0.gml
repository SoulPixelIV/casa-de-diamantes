/// @description Shortcuts

TARGET_FRAMERATE = 60 * global.timeScale;

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

