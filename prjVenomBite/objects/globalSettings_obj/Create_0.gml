/// @description Main settings

randomize();
global.timeScale = 1;
global.gamma = 1.4;
//display_reset(0, false);
TARGET_FRAMERATE = 60;
cursor_sprite = cursor_spr;

ideal_delta_time = 1000000 / room_speed;
global.dt = (delta_time / ideal_delta_time) * global.timeScale;

global.tilemap = layer_tilemap_get_id("TileCollider");

sprite_set_live(player_spr, true);
