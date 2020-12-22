/// @description Main settings

randomize();
global.timeScale = 1;
global.gamma = 1.4;
TARGET_FRAMERATE = 60;
cursor_sprite = cursor_spr;
realTimeScale = global.timeScale;
restartInProg = false;

room_speed = TARGET_FRAMERATE;

//application_surface_draw_enable(false);

global.optixFont = font_add("Optixal.ttf", 12, false, false, 32, 128);
global.casinoFont = font_add("Casino3DFilledMarquee.ttf", 30, false, false, 32, 128);
global.optixFontBig = font_add("Optixal.ttf", 14, true, false, 32, 128);
global.optixFontHuge = font_add("Optixal.ttf", 18, true, false, 32, 128);

//ideal_delta_time = 1000000 / room_speed;
//global.dt = clamp((delta_time / ideal_delta_time) * realTimeScale, 0.1, 3);
//global.dtNoSlowmo = clamp(delta_time / ideal_delta_time, 0.1, 3);
global.dt = ((delta_time / 1000000) * 185) * realTimeScale;
global.dtNoSlowmo = (delta_time / 1000000) * 185;

global.tilemap = layer_tilemap_get_id("TileCollider");

//sprite_set_live(playerJumpSpin_spr, true);

instance_create_layer(x, y, "GameManagerLayer", gifRecorder_obj);

room_goto_next();
