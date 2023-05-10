
/*-------------------------------------------------------------------------------------------------
	These functions are independent, so if you delete them from the asset, nothing will happen.
-------------------------------------------------------------------------------------------------*/

enum PP_DEBUG_TYPE {
	STACK_SURFACES,
	CHANNELS_HISTOGRAM,
}

global.__ppf_debug_shader_uniforms = {
	histogram_pos_res : shader_get_uniform(__ppf_sh_histogram, "u_pos_res"),
	histogram_data_tex : shader_get_sampler_index(__ppf_sh_histogram, "u_data_tex"),
}


// ------- WORK IN PROGRESS (don't use it yet) -------
/// @desc Draw post-processing system debug information on screen.
/// @param {Real} x1 X1 position of debug view.
/// @param {Real} y1 Y1 position of debug view.
/// @param {Real} x2 X2 of the debug view.
/// @param {Real} y2 Y2 of the debug view.
/// @param {Struct} pp_index The returned variable by "new PPFX_System()".
/// @param {Real} debug_type Debug view index. Example: PP_DEBUG_TYPE.CHANNELS_HISTOGRAM.
/// @param {Bool} draw_border Enable border drawing.
/// @returns {Undefined}
function ppfx_debug_draw(x1, y1, x2, y2, pp_index, debug_type, draw_border=false) {
	var _old_font = draw_get_font(),
	_old_color = draw_get_color(),
	_old_halign = draw_get_halign(),
	_old_blendmode = gpu_get_blendmode(),
	_width = x2 - x1,
	_height = y2 - y1,
	_title = "Unavailable\nThere is no preview for the type";
	draw_set_font(-1);
		
	// draw debug visualizations
	switch(debug_type) {
		case PP_DEBUG_TYPE.CHANNELS_HISTOGRAM:
			_title = "Channels Histogram";
			// histogram visualization
			draw_set_color(c_white);
			shader_set(__ppf_sh_histogram);
			shader_set_uniform_f(global.__ppf_debug_shader_uniforms.histogram_pos_res, x1, y1, _width, _height);
			texture_set_stage(global.__ppf_debug_shader_uniforms.histogram_data_tex, surface_get_texture(pp_index.GetRenderSurface())); 
			draw_sprite_stretched_ext(__spr_ppf_pixel, 0, x1, y1, _width, _height, c_black, 1);
			shader_reset();
			break;
			
			
		case PP_DEBUG_TYPE.STACK_SURFACES:
			_title = "Stack Surfaces";
			draw_set_color(c_black);
			draw_rectangle(x1, y1, x2, y2, false);
			draw_set_color(c_white);
			
			// draw stacks
			var _surf_array = pp_index.__stack_surface,
			i = 0, isize = pp_index.__stack_index+1,
			_surf = -1,
			_xx = 0,
			_yy = 0,
			_h_amount = ceil(isize/3),
			_v_amount = 3,
			_cellw = _width/_h_amount,
			_cellh = _height/_v_amount,
			_txt = "";
			
			repeat(isize) {
				_surf = _surf_array[i];
				if (surface_exists(_surf)) {
					_xx = i mod _h_amount;
					_yy = i div _h_amount;
					var _xxx = x1 + (_xx*_cellw);
					var _yyy = y1 + (_yy*_cellh);
					_txt = string(i);
					if (i == 0) _txt += " (source)";
					draw_surface_stretched(_surf, _xxx, _yyy, _cellw, _cellh);
					draw_set_color(c_white);
					gpu_set_blendmode(bm_max);
					draw_text(_xxx, _yyy, _txt);
					gpu_set_blendmode(bm_normal);
				}
				i++;
			}
			break;
				
		default:
			draw_set_color(make_color_rgb(20, 20, 20));
			draw_rectangle(x1, y1, x2, y2, false);
			draw_set_color(c_white);
			draw_sprite(__spr_ppf_debug_icon, 0, x1+_width/2, y1+_height/2);
			break;
	}
	// title
	draw_set_halign(fa_center);
	gpu_set_blendmode(bm_max);
	draw_text(x1+_width/2, y1+20, _title);
		
	// border
	draw_set_color(c_white);
	if (draw_border) draw_rectangle(x1+2, y1+2, x2-2, y2-2, true);
		
	// reset
	draw_set_font(_old_font);
	draw_set_color(_old_color);
	draw_set_halign(_old_halign);
	gpu_set_blendmode(_old_blendmode);
}

