
/*-------------------------------------------------------------------------------------------------
	These functions are independent, so if you delete them from the asset, nothing will happen.
-------------------------------------------------------------------------------------------------*/

// Feather ignore all

/// @desc Create a renderer for layers, which can use a post-processing system to apply effects to layers.
/// This function also allows to only render the content of a layer to a surface, without Post-Processing.
/// @returns {Struct}
function PPFX_LayerRenderer() constructor {
	__ppf_trace("Layer Renderer created. From: " + string(instance_exists(other) ? object_get_name(other.object_index) : instanceof(other)), 3);
	
	__room_size_based = false;
	__top_layer = -1;
	__bottom_layer = -1;
	__top_method = -1;
	__bottom_method = -1;
	__ppf_index = undefined;
	__cam_index = -1;
	__surf = -1;
	__surf_x = 0;
	__surf_y = 0;
	__surf_w = 2;
	__surf_h = 2;
	__surf_vw = 0;
	__surf_vh = 0;
	__is_render_enabled = true;
	__use_ppfx = true;
	__is_ready = false;
	__destroyed = false;
	
	#region Public Methods
	
	/// @func Destroy()
	/// @desc This function deletes a previously created post-processing layer, freeing memory. This function also removes layer scripts.
	/// @returns {undefined}
	static Destroy = function() {
		__ppf_surface_delete(__surf);
		layer_script_begin(__bottom_layer, -1);
		layer_script_end(__top_layer, -1);
		__destroyed = true;
	}
	
	/// @func Clean()
	/// @desc Clean LayerRenderer, without destroying it.
	/// Useful for when toggling rendering and want to make sure existing surfaces are destroyed.
	/// NOTE: It doesn't remove the effects or disable rendering completely. If you want to destroy, use .Destroy() method.
	/// @returns {undefined}
	static Clean = function() {
		__ppf_surface_delete(__surf);
	}
	
	/// @desc Toggle whether layer renderer can render on layer.
	/// If disabled, nothing will be rendered to the surface. That is, the layer will be drawn without the effects. Disabling this releases the system usage on the GPU.
	/// @param {Real} enable Will be either true (enabled, the default value) or false (disabled). The rendering will toggle if nothing or -1 is entered.
	/// @returns {undefined}
	static SetRenderEnable = function(enable=-1) {
		if (enable == -1) {
			__is_render_enabled = !__is_render_enabled;
		} else {
			__is_render_enabled = enable;
		}
	}
	
	/// @func SetRange(top_layer_id, bottom_layer_id)
	/// @desc This function defines a new range of layers from an existing ppfx layer system.
	/// 
	/// Make sure the top layer is above the bottom layer in order. If not, it may not render correctly.
	/// 
	/// Please note: You CANNOT select a range to which the layer has already been in range by another system. This will give an unbalanced surface stack error. If you want to use more effects, just add more effects to the profile.
	/// @param {Id.Layer} top_layer_id The top layer, in the room editor.
	/// @param {Id.Layer} bottom_layer_id The bottom layer, in the room editor.
	static SetRange = function(top_layer_id, bottom_layer_id) {
		__ppf_exception(!layer_exists(top_layer_id) || !layer_exists(bottom_layer_id), "One of the layers does not exist in the current room.");
		if (layer_get_depth(top_layer_id) > layer_get_depth(bottom_layer_id)) {
			__ppf_trace("WARNING: Inverted layer range order. Failed to render on layers: " + layer_get_name(top_layer_id) + ", " + layer_get_name(bottom_layer_id), 2);
		}
		__ppf_surface_delete(__surf);
		layer_script_begin(__bottom_layer, -1);
		layer_script_end(__top_layer, -1);
		__top_layer = top_layer_id;
		__bottom_layer = bottom_layer_id;
		layer_script_begin(__bottom_layer, __top_method);
		layer_script_end(__top_layer, __bottom_method);
	}
	
	/// @func GetSurface()
	/// @desc This function gets the surface with layer contents.
	/// @param {Bool} with_effects If true, it will return the surface of the layer with the effects applied (get post-processing surface). False is without the effects (get layer surface).
	/// @returns {Id.Surface} Surface index.
	static GetSurface = function(with_effects) {
		if (with_effects) {
			__ppf_exception(!ppfx_system_exists(__ppf_index), "The post-processing system does not exist, but you tried to get your surface.");
			return __ppf_index.GetRenderSurface();
		} else {
			return __surf;
		}
	}
	
	/// @func IsReady()
	/// @desc This function checks if the post-processing layer is ready to render, which allows you to get its surface safely (especially in HTML5).
	/// @returns {Undefined}
	static IsReady = function() {
		return __is_ready;
	}
	
	/// @func IsRenderEnabled()
	/// @desc This functions checks if the rendering of effects in the layer is enabled.
	static IsRenderEnabled = function() {
		return __is_render_enabled;
	}
	
	
	#endregion
	
	#region Render
	
	/// @func Apply(pp_index, top_layer_id, bottom_layer_id, draw_layer)
	/// @desc This function applies post-processing to one or more layers. You only need to call this ONCE in an object's "Create" or "Room Start" Event. Do NOT draw the system manually, if you use this. This function already draws the Post-Processing on the layer.
	///
	/// Make sure the Top Layer is above the Bottom Layer in order. If not, it may not render correctly.
	///
	/// Please note: You CANNOT select a range to which the layer has already been in range by another system. This will give an unbalanced surface stack error. If you want to use more effects, just add more effects to the profile.
	/// @param {Struct} pp_index The returned variable by ppfx_create(). You can use -1, noone or undefined, to not use a post-processing system, this way you can render the layer content on the surface only.
	/// @param {Id.Layer} top_layer_id The top layer, in the room editor
	/// @param {Id.Layer} bottom_layer_id The bottom layer, in the room editor
	/// @param {Bool} draw_layer If false, the surface (with layer contents) will not draw. The layer contents will still be rendered to the surface.
	/// @returns {Undefined}
	static Apply = function(pp_index, top_layer_id, bottom_layer_id, draw_layer=true) {
		// Feather disable GM1044
		__ppf_trace("Layer rendering from: " + layer_get_name(top_layer_id) + " to: " + layer_get_name(bottom_layer_id), 3);
		__ppf_exception(!layer_exists(top_layer_id) || !layer_exists(bottom_layer_id), "One of the layers does not exist in the current room.");
		__ppf_exception(layer_get_depth(top_layer_id) > layer_get_depth(bottom_layer_id), "Inverted layer range order. Failed to render on layers: " + layer_get_name(top_layer_id) + ", " + layer_get_name(bottom_layer_id));
		if (event_type != ev_create && event_type != ev_other) __ppf_trace("WARNING: You are calling <LayerRenderer>.Apply() in the wrong event.", 2);
		
		// run once
		__use_ppfx = !__ppf_is_undefined(pp_index);
		if (__use_ppfx) {
			pp_index.SetDrawEnable(draw_layer);
			pp_index.__layered = true;
		}
		__top_layer = top_layer_id;
		__bottom_layer = bottom_layer_id;
		__ppf_index = pp_index;
		
		// run every step
		__top_method = function() {
			if (!__is_render_enabled) exit;
			if (event_type == ev_draw && event_number == 0) {
				__cam_index = view_camera[view_current];
				__surf_x = camera_get_view_x(__cam_index);
				__surf_y = camera_get_view_y(__cam_index);
				__surf_w = camera_get_view_width(__cam_index);
				__surf_h = camera_get_view_height(__cam_index);
				__surf_vw = surface_get_width(application_surface);
				__surf_vh = surface_get_height(application_surface);
				if !surface_exists(__surf) __surf = surface_create(__surf_vw, __surf_vh, global.__ppf_main_texture_format);
				surface_set_target(__surf);
				draw_clear_alpha(c_black, 0);
				//gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
				camera_apply(__cam_index);
			}
		}
		__bottom_method = function() {
			if (!__is_render_enabled) exit;
			if (event_type == ev_draw && event_number == 0) {
				if (surface_exists(__surf)) {
					//gpu_set_blendmode(bm_normal);
					surface_reset_target();
					if (__use_ppfx) __ppf_index.Draw(__surf, __surf_x, __surf_y, __surf_w, __surf_h, __surf_vw, __surf_vh);
					__is_ready = true;
				}
			}
		}
		layer_script_begin(__bottom_layer, __top_method);
		layer_script_end(__top_layer, __bottom_method);
	}
	
	#endregion
}

/// @desc Checks if a previously created post-processing layer exists.
/// @param {any} pp_layer_index description
/// @returns {bool} description
function ppfx_layer_renderer_exists(pp_layer_index) {
	return (is_struct(pp_layer_index) && instanceof(pp_layer_index) == "PPFX_LayerRenderer");
}
