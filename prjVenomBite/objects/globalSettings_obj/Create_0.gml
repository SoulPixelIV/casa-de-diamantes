/// @description Main settings

randomize();
global.timeScale = 1;
global.gamma = 1.4;
//display_reset(0, false);
TARGET_FRAMERATE = 60;
cursor_sprite = cursor_spr;

ideal_delta_time = 1000000 / room_speed;
global.dt = clamp((delta_time / ideal_delta_time) * global.timeScale, 0.1, 5000);
global.dtNoSlowmo = delta_time / ideal_delta_time;

global.tilemap = layer_tilemap_get_id("TileCollider");

sprite_set_live(playerJumpSpin_spr, true);
