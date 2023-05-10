
#macro PPFX_VERSION "v3.1.1"
#macro PPFX_RELEASE_DATE "May, 03, 2023"

show_debug_message("Post-Processing FX " + PPFX_VERSION + " | " + "Copyright (C) 2023 FoxyOfJungle");


// PPFX Shaders
#macro __PPF_SH_BASE __ppf_sh_render_base
#macro __PPF_SH_HQ4X __ppf_sh_render_hq4x
#macro __PPF_SH_FXAA __ppf_sh_render_fxaa
#macro __PPF_SH_SUNSHAFTS __ppf_sh_render_sunshafts
#macro __PPF_SH_BLOOM_PRE_FILTER __ppf_sh_render_bloom_pre_filter
#macro __PPF_SH_BLOOM __ppf_sh_render_bloom
#macro __PPF_SH_DOF_COC __ppf_sh_render_dof_coc
#macro __PPF_SH_DOF_BOKEH __ppf_sh_render_dof_bokeh
#macro __PPF_SH_DOF __ppf_sh_render_dof
#macro __PPF_SH_SLOWMO_PRE_FILTER __ppf_sh_render_slowmo_pre_filter
#macro __PPF_SH_SLOWMO __ppf_sh_render_slowmo
#macro __PPF_SH_MOTION_BLUR __ppf_sh_render_motion_blur
#macro __PPF_SH_RADIAL_BLUR __ppf_sh_render_radial_blur
#macro __PPF_SH_COLOR_GRADING __ppf_sh_render_color_grading
#macro __PPF_SH_PALETTE_SWAP __ppf_sh_render_palette_swap
#macro __PPF_SH_KAWASE_BLUR __ppf_sh_render_kawase_blur
#macro __PPF_SH_GAUSSIAN_BLUR __ppf_sh_render_gaussian_blur
#macro __PPF_SH_VHS __ppf_sh_render_vhs
#macro __PPF_SH_CHROMABER __ppf_sh_render_chromaber
#macro __PPF_SH_FINAL __ppf_sh_render_final

#macro __PPF_SH_DS_BOX4 __ppf_sh_ds_box4
#macro __PPF_SH_DS_BOX13 __ppf_sh_ds_box13
#macro __PPF_SH_US_TENT9 __ppf_sh_us_tent9

#macro __PPF_SH_GNMSK __ppf_sh_generic_mask
#macro __PPF_SH_SPRMSK __ppf_sh_sprite_mask
#macro __PPF_SH_BLEND_NORMALS __ppf_sh_blend_normals

// Feather disable GM1003
// Feather disable GM1014
// Feather disable GM1044

enum PPF_HDR_TEX_FORMAT {
	RGBA32 = surface_rgba32float,
	RGBA16 = surface_rgba16float,
}

global.__ppf_main_texture_format_base = surface_rgba8unorm;
global.__ppf_main_texture_format = global.__ppf_main_texture_format_base;


#region Verify Compatibility
if (PPFX_CFG_HARDWARE_CHECKING) {
	if (!shaders_are_supported() && !__ppf_assert_and_func_array(shader_is_compiled, [
		__PPF_SH_DS_BOX4, __PPF_SH_DS_BOX13, __PPF_SH_US_TENT9, __PPF_SH_GNMSK, __PPF_SH_SPRMSK, __PPF_SH_BLEND_NORMALS,
		__PPF_SH_BASE, __PPF_SH_HQ4X, __PPF_SH_FXAA, __PPF_SH_SUNSHAFTS, __PPF_SH_BLOOM_PRE_FILTER, __PPF_SH_BLOOM, __PPF_SH_DOF_COC, __PPF_SH_DOF_BOKEH, __PPF_SH_DOF,  __PPF_SH_MOTION_BLUR,
		__PPF_SH_RADIAL_BLUR, __PPF_SH_COLOR_GRADING, __PPF_SH_PALETTE_SWAP, __PPF_SH_KAWASE_BLUR, __PPF_SH_GAUSSIAN_BLUR ,__PPF_SH_CHROMABER, __PPF_SH_FINAL, 
	])) {
		var _info = os_get_info(), _gpu = "", _is64 = "";
		switch(os_type) {
			case os_windows:
			case os_uwp: _gpu = "GPU: " + string(_info[? "video_adapter_description"]) + " | Dedicated Memory: " + string(_info[? "video_adapter_dedicatedvideomemory"]/1024/1024) + "MB"; break;
			case os_android: _gpu = "OpenGL: " + string(_info[? "GL_VERSION"]) + "\nGLSL: " + string(_info[? "GL_SHADING_LANGUAGE_VERSION"]) + "\nRenderer: " + string(_info[? "GL_RENDERER"]); break;
			case os_ios:
			case os_tvos:
			case os_linux:
			case os_macosx: _gpu = string(_info[? "gl_vendor_string"]) + " | " + string(_info[? "gl_renderer_string"]) + " | " + string(_info[? "gl_version_string"]); break;
			case os_xboxseriesxs: _gpu = string(_info[? "video_d3d12_currentrt"]); break;
			default: _gpu = "Unknown Device."; break;
		}
		_is64 = "is64bit: " + string(_info[? "is64bit"]) + " | ";
		var _trace = "\"Post-Processing FX\" will not work. Device does not support shaders.\n\n" + _is64 + _gpu;
		__ppf_trace(_trace, 1);
		show_message_async(_trace);
	}
}

// HDR compatibility verification
if (PPFX_CFG_HDR_ENABLE) {
	if (surface_format_is_supported(PPFX_CFG_HDR_TEX_FORMAT)) {
		global.__ppf_main_texture_format = PPFX_CFG_HDR_TEX_FORMAT;
	} else {
		var _format = "N/A";
		switch(PPFX_CFG_HDR_TEX_FORMAT) {
			case PPF_HDR_TEX_FORMAT.RGBA32: _format = "RGBA32" break;
			case PPF_HDR_TEX_FORMAT.RGBA16: _format = "RGBA16" break;
		}
		__ppf_trace("Error: " + _format + " Texture format is not supported on current platform!\nUsing RGBA8 (default). HDR disabled.", 1);
		global.__ppf_main_texture_format = global.__ppf_main_texture_format_base;
	}
}

#endregion

