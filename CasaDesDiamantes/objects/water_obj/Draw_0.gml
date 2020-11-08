draw_self() // draw the normal image

if (distance_to_object(player_obj) < 64) { 

	surface_player = surface_create(sprite_width, sprite_height)
	if (surface_exists(surface_player)) {
		
		surface_set_target(surface_player)
	
		draw_clear_alpha(c_black, 0);

		with(player_obj) {
			// make this one a little transparent 
			draw_sprite_ext(sprite_index,image_index,x-other.x,y-other.y+48,1,1,180,c_white,0.75) // give it a little offset
		}
	
		gpu_set_blendmode(bm_subtract) // draw_set_blend_mode() in GM 1.4
		draw_sprite(sprite_index,1,0,0) // this has the image we want to blank out
		gpu_set_blendmode(bm_normal)

		surface_reset_target()
	
		draw_surface(surface_player,x,y)
	
		surface_free(surface_player)
	}

}
