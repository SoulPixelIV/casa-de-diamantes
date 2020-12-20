if ( !surface_exists(surface) ) {
	surface = global.worldShadowMap;
}

surface_set_target(surface);
draw_clear_alpha(c_black,0);

gpu_set_blendmode(bm_add);

draw_sprite_ext(spr_light,0,room_width * 0.25,room_height * 0.25,1,1,0,c_green,1);
draw_sprite_ext(spr_light,0,room_width * 0.75,room_height * 0.25,1,1,0,c_blue,1);
draw_sprite_ext(spr_light,0,room_width * 0.25,room_height * 0.75,1,1,0,c_yellow,1);
draw_sprite_ext(spr_light,0,room_width * 0.75,room_height * 0.75,1,1,0,c_purple,1);

gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_colorbanding(surface,0,0,smoothness);