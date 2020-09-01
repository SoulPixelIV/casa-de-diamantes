/// @description Main settings

randomize();
global.timeScale = 1;
global.gamma = 1.4;
//display_reset(0, false);
TARGET_FRAMERATE = 60;
cursor_sprite = cursor_spr;
realTimeScale = global.timeScale;

global.optixFont = font_add("Optixal.ttf", 12, false, false, 32, 128);
global.optixFontBig = font_add("Optixal.ttf", 14, true, false, 32, 128);
global.optixFontHuge = font_add("Optixal.ttf", 18, true, false, 32, 128);

ideal_delta_time = 1000000 / room_speed;
global.dt = clamp((delta_time / ideal_delta_time) * realTimeScale, 0.1, 5000);
global.dtNoSlowmo = delta_time / ideal_delta_time;

global.tilemap = layer_tilemap_get_id("TileCollider");

//sprite_set_live(playerJumpSpin_spr, true);

instance_create_layer(x, y, "GameManagerLayer", gifRecorder_obj);
