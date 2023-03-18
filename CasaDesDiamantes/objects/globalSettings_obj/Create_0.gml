/// @description Main settings

randomize();
global.timeScale = 1;
global.gamma = 1.4;
TARGET_FRAMERATE = 240;
cursor_sprite = noone;
realTimeScale = global.timeScale;
restartInProg = false;
keyboardActive = true;

global.xScreenSize = 480;
global.yScreenSize = 270;

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

loadTimer = 1000;
loaded = false;
