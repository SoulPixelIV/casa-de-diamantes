/// @description Main settings

randomize();
global.timeScale = 1;
global.gamma = 1.4;
tf = 60;
TARGET_FRAMERATE = tf * global.timeScale;
cursor_sprite = cursor_spr;

global.tilemap = layer_tilemap_get_id("TileCollider");

