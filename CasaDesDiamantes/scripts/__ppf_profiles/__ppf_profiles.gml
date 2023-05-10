
// Feather ignore all

/// @desc Create a profile with predefined effects.
/// You can create multiple profiles with different effects and then load them in real time.
///
/// The order you add the effects to the array doesn't matter. They already have their own order.
///
/// To load this profile to the system, use system_id.ProfileLoad(profile_id).
/// @param {String} name Profile name. It only serves as a cosmetic and nothing else.
/// @param {Array} effects_array Array with all effects structs.
/// @returns {Struct} Profile struct.
function PPFX_Profile(name, effects_array) constructor {
	__ppf_trace("Profile created. From: " + string(instance_exists(other) ? object_get_name(other.object_index) : instanceof(other)), 3);
	__ppf_exception(!is_string(name), "Invalid profile name.");
	__ppf_exception(!is_array(effects_array), "Parameter is not an array containing effects.");
	
	__profile_name = name;
	__settings = {};
	__id = sha1_string_utf8(get_timer()+random(10000));
	__effects_array = effects_array;
	
	var i = 0, isize = array_length(effects_array), _name;
	repeat(isize) {
		_name = effects_array[i].effect_name;
		__settings[$ _name] = effects_array[i].sets;
		++i;
	}
	
	#region Public Methods
	/// @func GetName()
	/// @desc Get the name of the profile.
	/// @returns {String} Profile name.
	static GetName = function() {
		return profile_index.__profile_name;
	}
	
	/// @func SetName(name)
	/// @desc Set the name of the profile.
	/// @param {String} name New profile name.
	/// @returns {Undefined}
	static SetName = function(name) {
		__ppf_exception(!is_string(name), "Invalid profile name.");
		__profile_name = name;
	}
	
	/// @func Stringify(round_numbers)
	/// @desc This function parses and exports the profile in GML, for easy use.
	/// @param {Bool} round_numbers Sets whether to round numbers (removing decimals).
	/// @param {Bool} enabled_only Defines if will export only enabled effects.
	/// @returns {string} Description
	static Stringify = function(round_numbers=false, enabled_only=false) {
		__ppf_trace("Parsing " + "\"" + __profile_name + "\"" + " Profile. WARNING: The returned string will contain undefined textures.", 2);
		
		// methods
		static __parseEffect = function(constructor_name="", array, round_numb=false, delimiter=", ") {
			var _effect_string = "\tnew " + constructor_name + "(";
			var _val = undefined, i = 0, isize = array_length(array);
			repeat(isize) {
				// get value
				_val = array[i];
				// bool
				if (is_bool(_val)) {
					_val = _val ? "true" : "false";
				}
				// pointer
				if (is_ptr(_val)) {
					_val = "undefined";
				}
				// array
				if (is_array(_val)) {
					// vec2
					if (array_length(_val) < 3) _val = "[" + string(_val[0]) + ", " + string(_val[1]) + "]";
					// color (try)
					if (array_length(_val) > 2) _val = "make_color_rgb(" + string(_val[0]*255) + ", " + string(_val[1]*255) + ", " + string(_val[2]*255) + ")"  ;
				}
				// real
				if (is_real(_val)) {
					if (_val < 0.0001) _val = 0; else
					// round number
					if (round_numb && _val > 1) _val = round(_val);
				}
				// concat
				_effect_string += string(_val);
				// add delimiter
				if (i != isize-1) _effect_string += delimiter;
				++i;
			}
			return _effect_string + "),";
		}
		
		// init
		var _final_text = @"game_profile = new PPFX_Profile(" + "\"" + __profile_name + "\"" + ", [\n";
		
		try {
			// loop effects
			var _array = __effects_array;
			var i = 0, isize = array_length(_array);
			repeat(isize) {
				var _struct = _array[i];
				var _name = _struct.effect_name;
				var _set = _struct.sets;
				if (_set.enabledd || !enabled_only) {
					// parse effects
					switch(_name) {
						case "rotation": _final_text += __parseEffect("FX_Rotation", [_set.enabledd, _set.angle], round_numbers); break;
						case "zoom": _final_text += __parseEffect("FX_Zoom", [_set.enabledd, _set.amount, _set.range, _set.center], round_numbers); break;
						case "shake": _final_text += __parseEffect("FX_Shake", [_set.enabledd, _set.speedd, _set.magnitude, _set.hspeedd, _set.vspeedd], round_numbers); break;
						case "panorama": _final_text += __parseEffect("FX_Panorama", [_set.enabledd, _set.depth_x, _set.depth_y], round_numbers); break;
						case "lens_distortion": _final_text += __parseEffect("FX_LensDistortion", [_set.enabledd, _set.amount], round_numbers); break;
						case "pixelize": _final_text += __parseEffect("FX_Pixelize", [_set.enabledd, _set.amount, _set.squares_max, _set.steps], round_numbers); break;
						case "swirl": _final_text += __parseEffect("FX_Swirl", [_set.enabledd, _set.angle, _set.radius, _set.center], round_numbers); break;
						case "displacemap": _final_text += __parseEffect("FX_DisplaceMap", [_set.enabledd, _set.amount, _set.zoom, _set.speedd, _set.angle, _set.texture, _set.offset], round_numbers); break;
						case "sine_wave": _final_text += __parseEffect("FX_SineWave", [_set.enabledd, _set.speedd, _set.amplitude, _set.frequency, _set.offset], round_numbers); break;
						case "glitch": _final_text += __parseEffect("FX_Glitch", [_set.enabledd, _set.speedd, _set.block_size, _set.interval, _set.intensity, _set.peak_amplitude1, _set.peak_amplitude2], round_numbers); break;
						case "shockwaves": _final_text += __parseEffect("FX_Shockwaves", [_set.enabledd, _set.aberration, _set.prisma_lut_tex, _set.texture], round_numbers); break;
						case "white_balance": _final_text += __parseEffect("FX_WhiteBalance", [_set.enabledd, _set.temperature, _set.tint], round_numbers); break;
						case "hq4x": _final_text += __parseEffect("FX_HQ4x", [_set.enabledd, _set.smoothness, _set.sharpness, _set.downscale], round_numbers); break;
						case "fxaa": _final_text += __parseEffect("FX_FXAA", [_set.enabledd, _set.strength], round_numbers); break;
						case "sunshafts": _final_text += __parseEffect("FX_SunShafts", [_set.enabledd, _set.position, _set.threshold, _set.intensity, _set.dimmer, _set.scattering, _set.center_smoothness, _set.noise_enable, _set.rays_intensity, _set.rays_tiling, _set.rays_speed, _set.downscale, _set.noise_tex, _set.debug], round_numbers); break;
						case "bloom": _final_text += __parseEffect("FX_Bloom", [_set.enabledd, _set.iterations, _set.threshold, _set.intensity, _set.colorr, _set.white_amount, _set.dirt_enable, _set.dirt_texture, _set.dirt_intensity, _set.dirt_scale, _set.downscale, _set.debug1, _set.debug2], round_numbers); break;
						case "depth_of_field": _final_text += __parseEffect("FX_DepthOfField", [_set.enabledd, _set.radius, _set.intensity, _set.shaped, _set.blades_aperture, _set.blades_angle, _set.use_zdepth, _set.zdepth_tex, _set.focus_distance, _set.focus_range, _set.downscale, _set.debug], round_numbers); break;
						case "slow_motion": _final_text += __parseEffect("FX_SlowMotion", [_set.enabledd, _set.intensity, _set.iterations], round_numbers); break;
						case "motion_blur": _final_text += __parseEffect("FX_MotionBlur", [_set.enabledd, _set.angle, _set.radius, _set.center, _set.mask_power, _set.mask_scale, _set.mask_smoothness, _set.overlay_texture], round_numbers); break;
						case "radial_blur": _final_text += __parseEffect("FX_RadialBlur", [_set.enabledd, _set.radius, _set.inner, _set.center], round_numbers); break;
						case "lut": _final_text += __parseEffect("FX_LUT", [_set.enabledd, _set.texture, _set.intensity, _set.size, _set.squares], round_numbers); break;
						case "exposure": _final_text += __parseEffect("FX_Exposure", [_set.enabledd, _set.value], round_numbers); break;
						case "posterization": _final_text += __parseEffect("FX_Posterization", [_set.enabledd, _set.color_factor], round_numbers); break;
						case "brightness": _final_text += __parseEffect("FX_Brightness", [_set.enabledd, _set.value], round_numbers); break;
						case "contrast": _final_text += __parseEffect("FX_Contrast", [_set.enabledd, _set.value], round_numbers); break;
						case "shadow_midtone_highlight": _final_text += __parseEffect("FX_ShadowMidtoneHighlight", [_set.enabledd, _set.shadow_color, _set.midtone_color, _set.highlight_color, _set.shadow_range, _set.highlight_range], round_numbers); break;
						case "saturation": _final_text += __parseEffect("FX_Saturation", [_set.enabledd, _set.value], round_numbers); break;
						case "hue_shift": _final_text += __parseEffect("FX_HueShift", [_set.enabledd, _set.hue, _set.saturation], round_numbers); break;
						case "colorize": _final_text += __parseEffect("FX_Colorize", [_set.enabledd, _set.hue, _set.saturation, _set.value, _set.intensity], round_numbers); break;
						case "color_tint": _final_text += __parseEffect("FX_ColorTint", [_set.enabledd, _set.color], round_numbers); break;
						case "invert_colors": _final_text += __parseEffect("FX_InvertColors", [_set.enabledd, _set.intensity], round_numbers); break;
						case "texture_overlay": _final_text += __parseEffect("FX_TextureOverlay", [_set.enabledd, _set.intensity, _set.zoom, _set.texture], round_numbers); break;
						case "lift_gamma_gain": _final_text += __parseEffect("FX_LiftGammaGain", [_set.enabledd, _set.lift, _set.gamma, _set.gain], round_numbers); break;
						case "tone_mapping": _final_text += __parseEffect("FX_ToneMapping", [_set.enabledd, _set.mode], round_numbers); break;
						case "palette_swap": _final_text += __parseEffect("FX_PaletteSwap", [_set.enabledd, _set.row, _set.flip, _set.texture, _set.pal_height, _set.threshold, _set.limit_colors], round_numbers); break;
						case "kawase_blur": _final_text += __parseEffect("FX_KawaseBlur", [_set.enabledd, _set.amount, _set.mask_power, _set.mask_scale, _set.mask_smoothness, _set.downscale, _set.iterations], round_numbers); break;
						case "gaussian_blur": _final_text += __parseEffect("FX_GaussianBlur", [_set.enabledd, _set.amount, _set.mask_power, _set.mask_scale, _set.mask_smoothness, _set.downscale], round_numbers); break;
						case "vhs": _final_text += __parseEffect("FX_VHS", [_set.enabledd, _set.chromatic_aberration, _set.scan_aberration, _set.grain_intensity, _set.grain_height, _set.grain_fade, _set.grain_amount, _set.grain_speed, _set.grain_interval, _set.scan_speed, _set.scan_size, _set.scan_offset, _set.hscan_offset, _set.flickering_intensity, _set.flickering_speed, _set.wiggle_amplitude], round_numbers); break;
						case "chromatic_aberration": _final_text += __parseEffect("FX_ChromaticAberration", [_set.enabledd, _set.intensity, _set.angle, _set.only_outer, _set.center_radius, _set.blur_enable, _set.prisma_lut_tex], round_numbers); break;
						case "mist": _final_text += __parseEffect("FX_Mist", [_set.enabledd, _set.intensity, _set.scale, _set.tiling, _set.speedd, _set.angle, _set.contrast, _set.powerr, _set.remap, _set.colorr, _set.mix, _set.mix_threshold, _set.noise_tex, _set.offset, _set.fade_amount, _set.fade_angle], round_numbers); break;
						case "speedlines": _final_text += __parseEffect("FX_SpeedLines", [_set.enabledd, _set.scale, _set.tiling, _set.speedd, _set.rot_speed, _set.contrast, _set.contrast, _set.powerr, _set.remap, _set.colorr, _set.mask_power, _set.mask_scale, _set.mask_smoothness, _set.noise_tex], round_numbers); break;
						case "dithering": _final_text += __parseEffect("FX_Dithering", [_set.enabledd, _set.threshold, _set.strength, _set.mode, _set.scale, _set.bayer_texture, _set.bayer_size], round_numbers); break;
						case "noise_grain": _final_text += __parseEffect("FX_NoiseGrain", [_set.enabledd, _set.intensity, _set.luminosity, _set.scale, _set.speedd, _set.mix, _set.noise_tex], round_numbers); break;
						case "vignette": _final_text += __parseEffect("FX_Vignette", [_set.enabledd, _set.intensity, _set.curvature, _set.inner, _set.outer, _set.colorr, _set.center], round_numbers); break;
						case "scanlines": _final_text += __parseEffect("FX_ScanLines", [_set.enabledd, _set.intensity, _set.speedd, _set.amount, _set.colorr, _set.mask_power, _set.mask_scale, _set.mask_smoothness], round_numbers); break;
						case "nes_fade": _final_text += __parseEffect("FX_NESFade", [_set.enabledd, _set.amount, _set.levels], round_numbers); break;
						case "fade": _final_text += __parseEffect("FX_Fade", [_set.enabledd, _set.amount, _set.colorr], round_numbers); break;
						case "cinema_bars": _final_text += __parseEffect("FX_CinemaBars", [_set.enabledd, _set.amount, _set.colorr, _set.vertical_enable, _set.horizontal_enable, _set.is_fixed], round_numbers); break;
						case "color_blindness": _final_text += __parseEffect("FX_ColorBlindness", [_set.enabledd, _set.mode], round_numbers); break;
						case "channels": _final_text += __parseEffect("FX_Channels", [_set.enabledd, _set.red, _set.green, _set.blue], round_numbers); break;
						case "border": _final_text += __parseEffect("FX_Border", [_set.enabledd, _set.curvature, _set.smooth, _set.colorr], round_numbers); break;
					}
					_final_text += "\n";
				}
				++i;
			}
			_final_text += "]);"
		}
		catch(error) {
			__ppf_trace("Error parsing " + "\"" + __profile_name + "\"" + " profile.\n> " + error.message, 1);
			return undefined;
		}
		
		return _final_text;
	}
	#endregion
}
