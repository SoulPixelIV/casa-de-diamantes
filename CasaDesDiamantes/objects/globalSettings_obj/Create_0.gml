/// @description Main settings

randomize();
global.timeScale = 1;
global.gamma = 1.4;
global.zoom = 3;
TARGET_FRAMERATE = 50;
cursor_sprite = noone;
realTimeScale = global.timeScale;
restartInProg = false;
keyboardActive = true;

global.xScreenSize = 480;
global.yScreenSize = 270;

window_set_size(global.xScreenSize * 3, global.yScreenSize * 3);
surface_resize(application_surface, global.xScreenSize, global.yScreenSize);
display_set_gui_size(global.xScreenSize, global.yScreenSize);

global.pause = false;

surface_depth_disable(true);

game_set_speed(TARGET_FRAMERATE, gamespeed_fps);

//application_surface_draw_enable(false);
global.optixFont = font_add("Optixal.ttf", 12, false, false, 32, 128);
global.casinoFont = font_add("Casino3DFilledMarquee.ttf", 30, false, false, 32, 128);
global.optixFontBig = font_add("Optixal.ttf", 14, true, false, 32, 128);
global.optixFontHuge = font_add("Optixal.ttf", 18, true, false, 32, 128);

//ideal_delta_time = 1000000 / room_speed;
//global.dt = clamp((delta_time / ideal_delta_time) * realTimeScale, 0.1, 3);
//global.dtNoSlowmo = clamp(delta_time / ideal_delta_time, 0.1, 3);
global.dt = clamp(((delta_time / 1000000) * 185) * realTimeScale, 0, 10);
global.dtNoSlowmo = clamp((delta_time / 1000000) * 185, 0, 10);

global.tilemap = layer_tilemap_get_id("TileCollider");

//sprite_set_live(playerJumpSpin_spr, true);

//instance_create_layer(x, y, "GameManagerLayer", gifRecorder_obj);

loadTimer = 100;
loaded = false;

global.soundVolume = 100;
global.musicVolume = 100;
global.speedrunTimer = false;

//LOAD SETTINGS
if (file_exists("gameSettings")) {
	loadSettings_scr();
}