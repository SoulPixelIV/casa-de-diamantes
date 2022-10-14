/// @description Shortcuts

//Timescale
if (realTimeScale < global.timeScale)
{
	if (!player_obj.enemySlowmo)
	{
		realTimeScale += 0.02;
	}
	else
	{
		realTimeScale += 0.5;
	}
}
if (realTimeScale > global.timeScale)
{
	if (!player_obj.enemySlowmo)
	{
		realTimeScale -= 0.02;
	}
	else
	{
		realTimeScale -= 0.03;
	}
}

if (realTimeScale > global.timeScale - 0.03 && realTimeScale < global.timeScale + 0.03)
{
	realTimeScale = global.timeScale;
}

//Lock Cursor
if (window_has_focus())
{
	display_mouse_lock(window_get_x(), window_get_y(), window_get_width(), window_get_height());
}
else
{
	display_mouse_unlock();
}

if (keyboard_check_pressed(vk_f1))
{
	restartInProg = true;
	global.timer = 0;
	part_emitter_destroy_all(global.partSystem);
	room_restart();
}
if (keyboard_check_pressed(vk_f2))
{
	if (instance_exists(player_obj))
	{
		player_obj.y -= 32;
	}
}
if (keyboard_check_pressed(vk_f3) && room != mainmenu)
{
	part_emitter_destroy_all(global.partSystem);
	audio_stop_all();
	instance_destroy(player_obj);
	room_goto(levelSelect);
}
if (keyboard_check_pressed(vk_f4))
{
	part_emitter_destroy_all(global.partSystem);
	instance_destroy(player_obj);
	room_goto(level1_SenzelaForest);
}
if (keyboard_check_pressed(vk_f5))
{
	part_emitter_destroy_all(global.partSystem);
	instance_destroy(player_obj);
	room_goto(level2_SenzelaForest);
}
if (keyboard_check_pressed(vk_f6))
{
	part_emitter_destroy_all(global.partSystem);
	instance_destroy(player_obj);
	room_goto(level3_SenzelaForest);
}
/*
if (keyboard_check_pressed(vk_f11))
{
	global.gamma -= 0.1;
}
if (keyboard_check_pressed(vk_f12))
{
	global.gamma += 0.1;
}
*/

if (room == level0) {
	global.ambientShadowIntensity = 0.5 * global.gamma;
}
else if (room == level1_RoadToCasino || room == level0_RoadToCasino)
{
	global.ambientShadowIntensity = 0.45 * global.gamma;
}
else if (room == level_CasinoHub)
{
	global.ambientShadowIntensity = 0.5 * global.gamma;
}
else if (room == blackjackTable)
{
	global.ambientShadowIntensity = 0.55 * global.gamma;
}
else if (room == level0_SenzelaForest || room == level1_SenzelaForest || room == level2_SenzelaForest || room == level3_SenzelaForest)
{
	global.ambientShadowIntensity = 0.53 * global.gamma;
}
else if (room == level0_Powerplant || room == level1_Powerplant || room == level2_Powerplant || room == level3_Powerplant)
{
	global.ambientShadowIntensity = 0.3 * global.gamma;
}
else if (room == warpzone_Powerplant)
{
	global.ambientShadowIntensity = 0.7 * global.gamma;
}
else if (room == level0_DarkSewers)
{
	global.ambientShadowIntensity = 0.7 * global.gamma;
}
else
{
	global.ambientShadowIntensity = 0.6 * global.gamma;
}