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
/*
if (os_is_paused())
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
} */

if (keyboard_check_pressed(ord("P")))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
}

if (keyboard_check_pressed(vk_f1))
{
	restartInProg = true;
	part_emitter_destroy_all(global.partSystem);
	room_restart();
}
if (keyboard_check_pressed(vk_f2))
{
	part_emitter_destroy_all(global.partSystem);
	instance_destroy(player_obj);
	room_goto(level0_RoadToCasino);
	global.spawn = 0;
}
if (keyboard_check_pressed(vk_f3))
{
	part_emitter_destroy_all(global.partSystem);
	instance_destroy(player_obj);
	room_goto(level1_RoadToCasino);
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

if (room == level1_RoadToCasino || room == level0_RoadToCasino)
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
else if (room == level0_SenzelaForest || room == level1_SenzelaForest)
{
	global.ambientShadowIntensity = 0.6 * global.gamma;
}
else if (room == level2_SenzelaForest)
{
	global.ambientShadowIntensity = 0.55 * global.gamma;
}
else
{
	global.ambientShadowIntensity = 0.6 * global.gamma;
}

//Crosshair Setup
if (instance_exists(player_obj))
{
	if (player_obj.inputMethod == 0)
	{
		cursor_sprite = cursor_spr;
	}
	else
	{
		cursor_sprite = -1;
	}
}