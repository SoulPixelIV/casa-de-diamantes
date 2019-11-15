/// @description Lighting

if !surface_exists(surface)
{
    surface = surface_create(room_width, room_height);
    surfaceScale = 1;
}
else
{
	surface_set_target(surface);
	draw_clear(c_black);
	if (instance_exists(particleBlue_obj))
	{
	    with(particles)
	    {
	        gpu_set_blendmode(bm_add);
	        draw_sprite_ext(light_spr, 0, x*other.surfaceScale, y*other.surfaceScale, lightSize*other.surfaceScale, lightSize*other.surfaceScale, 0, c_white, lightStrength);
	        gpu_set_blendmode(bm_normal);
	    }
	}
	with(lights_obj)
	{
	    gpu_set_blendmode(bm_add);
	    draw_sprite_ext(light_spr, 0, x*other.surfaceScale, y*other.surfaceScale, lightSize*other.surfaceScale, lightSize*other.surfaceScale, 0, c_white, lightStrength);
	    gpu_set_blendmode(bm_normal);
	}
	with (spotLight_obj)
	{
	    gpu_set_blendmode(bm_add);
	    draw_sprite_ext(spotlight_spr, 0, x*other.surfaceScale, y*other.surfaceScale, lightSize*other.surfaceScale, lightSize*other.surfaceScale, 0, c_white, spotLight_obj.lightStrength);
	    gpu_set_blendmode(bm_normal);
	}
	with (lightsRed_obj)
	{
	    gpu_set_blendmode(bm_add);
	    draw_sprite_ext(light_spr, 0, x*other.surfaceScale, y*other.surfaceScale, lightSize*other.surfaceScale, lightSize*other.surfaceScale, 0, c_red, lightsRed_obj.lightStrength);
	    gpu_set_blendmode(bm_normal);
	}
	with (lightsBlue_obj)
	{
	    gpu_set_blendmode(bm_add);
	    draw_sprite_ext(light_spr, 0, x*other.surfaceScale, y*other.surfaceScale, lightSize*other.surfaceScale, lightSize*other.surfaceScale, 0, c_blue, lightsBlue_obj.lightStrength);
	    gpu_set_blendmode(bm_normal);
	}
	surface_reset_target();
	draw_surface_ext(surface, 0, 0, 1/surfaceScale, 1/surfaceScale, 0, c_white, 0.1);
}
