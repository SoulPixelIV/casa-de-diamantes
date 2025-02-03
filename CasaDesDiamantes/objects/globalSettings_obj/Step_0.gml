/// @description Shortcuts

loadTimer -= global.dt;
if (loadTimer < 0 && !loaded) {
	room_goto_next();
	loaded = true;
}

//Timescale
if (realTimeScale < global.timeScale)
{
	if (instance_exists(player_obj)) {
		if (!player_obj.enemySlowmo)
		{
			realTimeScale += 0.02;
		}
		else
		{
			realTimeScale += 0.5;
		}
	} else {
		realTimeScale += 0.02;
	}
}
if (realTimeScale > global.timeScale)
{
	if (instance_exists(player_obj)) {
		if (!player_obj.enemySlowmo)
		{
			realTimeScale -= 0.02;
		}
		else
		{
			realTimeScale -= 0.03;
		}
	} else {
		realTimeScale -= 0.02;
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
if (keyboard_check_pressed(vk_f3) && room != mainmenu && room != levelSelect && room != worldmap && room != credits && room != cutscene0 && room != cutscene1 && !global.pause)
{
	part_emitter_destroy_all(global.partSystem);
	audio_stop_all();
	instance_destroy(player_obj);
	room_goto(levelSelect);
}
if (keyboard_check_pressed(vk_f4) && room != mainmenu && room != levelSelect && room != worldmap && room != credits && room != cutscene0 && room != cutscene1 && !global.pause)
{
	part_emitter_destroy_all(global.partSystem);
	audio_stop_all();
	instance_destroy(player_obj);
	room_goto(storySelect);
}
if (keyboard_check_pressed(vk_f7) && room != mainmenu && room != levelSelect && room != worldmap && room != credits && room != cutscene0 && room != cutscene1 && !global.pause)
{
	global.money += 1000;
	camera_obj.scoreSpin = true;
	camera_obj.scoreDif = true;
	camera_obj.scoreSpinTimer = camera_obj.scoreSpinTimerSave;
	camera_obj.scoreDifTimer = camera_obj.scoreDifTimerSave;
	camera_obj.chipDif += 1000;
	audio_play_sound(coin3_snd, 1, false);
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

if (room == level0 || room == level1 || room == level2 || room == level3 || room == warpzone1 || room == warpzone2 || room == warpzone3) {
	global.ambientShadowIntensity = 0.5 * global.gamma;
}
else if (room == level1_RoadToCasino || room == level0_RoadToCasino)
{
	global.ambientShadowIntensity = 0.45 * global.gamma;
}
else if (room == level4 || room == level5A || room == level5B || room == level6 || room == level7 || room == level8 || room == level9 || room == level15)
{
	global.ambientShadowIntensity = 0.5 * global.gamma;
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
else if (room == level10 || room == level11 || room == level12 || room == level13 || room == level14)
{
	global.ambientShadowIntensity = 0.6 * global.gamma;
}
else if (room == level16)
{
	global.ambientShadowIntensity = 0.4 * global.gamma;
}
else if (room == level20)
{
	global.ambientShadowIntensity = 0.3 * global.gamma;
}
else
{
	global.ambientShadowIntensity = 0.6 * global.gamma;
}

//Pause
if (global.pause) {
	global.dt = 0;
}