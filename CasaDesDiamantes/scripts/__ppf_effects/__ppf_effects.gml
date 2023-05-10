
// Feather ignore all

// effects enumerator
enum FX_EFFECT {
	ROTATION,
	ZOOM,
	SHAKE,
	LENS_DISTORTION,
	PIXELIZE,
	SWIRL,
	PANORAMA,
	SINE_WAVE,
	GLITCH,
	SHOCKWAVES,
	DISPLACEMAP,
	WHITE_BALANCE,
	BORDER,
	HQ4X,
	FXAA,
	BLOOM,
	SLOW_MOTION,
	SUNSHAFTS,
	DEPTH_OF_FIELD,
	MOTION_BLUR,
	BLUR_RADIAL,
	LUT,
	EXPOSURE,
	POSTERIZATION,
	BRIGHTNESS,
	CONTRAST,
	SHADOW_MIDTONE_HIGHLIGHT,
	SATURATION,
	HUE_SHIFT,
	COLORIZE,
	COLOR_TINT,
	INVERT_COLORS,
	TEXTURE_OVERLAY,
	LIFT_GAMMA_GAIN,
	TONE_MAPPING,
	PALETTE_SWAP,
	BLUR_KAWASE,
	BLUR_GAUSSIAN,
	VHS,
	CHROMATIC_ABERRATION,
	MIST,
	SPEEDLINES,
	DITHERING,
	NOISE_GRAIN,
	VIGNETTE,
	NES_FADE,
	FADE,
	SCANLINES,
	CINEMA_BARS,
	COLOR_BLINDNESS,
	CHANNELS,
}

/// @desc This effect rotates the screen, maintaining aspect ratio.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} angle Rotation angle in degrees.
function FX_Rotation(enabled, angle=0) constructor {
	effect_name = "rotation";
	sets = {
		enabledd : enabled,
		angle : angle,
	};
}

/// @desc This effect zooms (enlarges the image), following the normalized center position.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount Zoom amount: 1 to 2.
/// @param {Real} range Zoom range. Example: 1 or 10.
/// @param {Array<Real>} center Zoom focus position. An array with the normalized values (0 to 1), in this format: [x, y].
function FX_Zoom(enabled, amount=1, range=1, center=[0.5, 0.5]) constructor {
	effect_name = "zoom";
	sets = {
		enabledd : enabled,
		amount : amount,
		range : range,
		center : center,
	};
}

/// @desc This effect causes the screen to shake.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} speedd Shake speed. A value from 0 to +inf.
/// @param {Real} magnitude Sets how far the screen will flicker, higher values means more shaking. Try values from 0 to 1.
/// @param {Real} hspeedd Horizontal shake speed.
/// @param {Real} vspeedd Vertical shake speed.
function FX_Shake(enabled, speedd=0.25, magnitude=0.01, hspeedd=1, vspeedd=1) constructor {
	effect_name = "shake";
	sets = {
		enabledd : enabled,
		speedd : speedd,
		magnitude : magnitude,
		hspeedd : hspeedd,
		vspeedd : vspeedd,
	};
}

/// @desc This effect simulates CRT distortion, where the distortion can be positive or negative.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount Distortion amount. Positive = Barrel, Negative = Pincushion.
function FX_LensDistortion(enabled, amount=0) constructor {
	effect_name = "lens_distortion";
	sets = {
		enabledd : enabled,
		amount : amount,
	};
}

/// @desc Turn small pixels into artificial big pixels.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount Pixel resolution. 0 to 1.
/// @param {Real} squares_max Maximum amount of squares. 20 recommended.
/// @param {Real} steps Steps to change pixelation intensity. Helps prevent sudden change.
function FX_Pixelize(enabled, amount=0.5, squares_max=20, steps=50) constructor {
	effect_name = "pixelize";
	sets = {
		enabledd : enabled,
		amount : amount,
		squares_max : squares_max,
		steps : steps,
	};
}

/// @desc Creates a swirl effect (like a Black Hole) at the defined position.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} angle Swirl angle. In degress, 0 to 360.
/// @param {Real} radius Swirl radius. 0 to 1.
/// @param {Array<Real>} center The position. An array with the normalized values (0 to 1), in this format: [x, y].
function FX_Swirl(enabled, angle=35, radius=1, center=[0.5,0.5]) constructor {
	effect_name = "swirl";
	sets = {
		enabledd : enabled,
		angle : angle,
		radius : radius,
		center : center,
	};
}

/// @desc Creates a side warp effect to simulate perspective.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} depth_x The horizontal distortion depth. 0 to 3.
/// @param {Real} depth_y The vertical distortion depth. 0 to 3.
function FX_Panorama(enabled, depth_x=1, depth_y=0) constructor {
	effect_name = "panorama";
	sets = {
		enabledd : enabled,
		depth_x : depth_x,
		depth_y : depth_y,
	};
}

/// @desc Create a sine wave effect on the screen, using frequency and amplitude.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} speedd Animation speed.
/// @param {Array<Real>} amplitude Sine wave amplitude.
/// @param {Array<Real>} frequency Sine wave frequency.
/// @param {Array<Real>} offset Position offset. Use the camera position. An array with absolute values, in this format: [cam_x, cam_y].
function FX_SineWave(enabled, speedd=0.5, amplitude=[0.02,0.02], frequency=[10,10], offset=[0,0]) constructor {
	effect_name = "sine_wave";
	sets = {
		enabledd : enabled,
		speedd : speedd,
		amplitude : amplitude,
		frequency : frequency,
		offset : offset,
	};
}

/// @desc Create on-screen glitch effects to simulate broadcast glitches like old TV or cyber futuristic.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} speedd Glitch animation speed.
/// @param {Real} block_size Vertical bars size.
/// @param {Real} interval Interval to start failure. Closer to 1 means rarer.
/// @param {Real} intensity Displace amount.
/// @param {Real} peak_amplitude1 Distortion when reaching the interval.
/// @param {Real} peak_amplitude2 Distortion out of interval.
function FX_Glitch(enabled, speedd=1, block_size=0.9, interval=0.995, intensity=0.2, peak_amplitude1=2, peak_amplitude2=1.5) constructor {
	effect_name = "glitch";
	sets = {
		enabledd : enabled,
		speedd : speedd,
		block_size : block_size,
		interval : interval,
		intensity : intensity,
		peak_amplitude1 : peak_amplitude1,
		peak_amplitude2 : peak_amplitude2,
	};
}

/// @desc Shockwaves screen distortion effect, perfect for enhancing explosion simulation or related stuff.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount Displacement amount. 0 to 1.
/// @param {Real} aberration Chromatic aberration offset amount. 0 to 1.
/// @param {Pointer.Texture} prisma_lut_tex Spectral The spectral LUT texture, used to define the spectral colors.
/// Texture should be 8x3, with RGB channels horizontally. Use sprite_get_texture() or surface_get_texture().
/// @param {Pointer.Texture} texture Normalmap surface. Use shockwave_render() to make it easy.
function FX_Shockwaves(enabled, amount=0.1, aberration=0.1, prisma_lut_tex=undefined, texture=undefined) constructor {
	effect_name = "shockwaves";
	sets = {
		enabledd : enabled,
		amount : amount,
		aberration : aberration,
		prisma_lut_tex : __ppf_is_undefined(prisma_lut_tex) ? __PPF_ST.default_shockwaves_prisma_lut : prisma_lut_tex,
		texture : __ppf_is_undefined(texture) ? __PPF_ST.default_normal : texture,
	};
}

/// @desc Displacement screen distortion effect, perfect for simulating rain, water drops/drops on the screen and related things
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount Displacement amount. 0 to 1.
/// @param {Real} zoom Zoom scale value. 1 - 20 recommended.
/// @param {Real} speedd Movement speed.
/// @param {Real} angle Movemente direction.
/// @param {Pointer.Texture} texture Normal map texture with distortion information.
/// @param {Array<Real>} offset Position offset. Use the camera position. An array with absolute values, in this format: [cam_x, cam_y].
function FX_DisplaceMap(enabled, amount=0.1, zoom=1, speedd=0.1, angle=0, texture=undefined, offset=[0,0]) constructor {
	effect_name = "displacemap";
	sets = {
		enabledd : enabled,
		amount : amount,
		zoom : zoom,
		angle : angle,
		speedd : speedd,
		texture : __ppf_is_undefined(texture) ? __PPF_ST.default_normal : texture,
		offset : offset,
	};
}

/// @desc Creates an edge gradient effect at the corners of the screen. Intended to be used when using Lens Distortion effect, to hide non-UV artifacts.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} curvature The border curvature. 0 to 1 recommended.
/// @param {Real} smooth Border smoothness. 0 to 1 recommended.
/// @param {Real} colorr The border color. Example: c_black.
function FX_Border(enabled, curvature=0, smooth=0, colorr=c_black) constructor {
	effect_name = "border";
	sets = {
		enabledd : enabled,
		curvature : curvature,
		smooth : smooth,
		colorr : make_color_ppfx(colorr),
	};
}

/// @desc White balance is used to adjust colors to match the color of the light source so that white objects appear white.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} temperature Higher values result in a warmer color temperature and lower values result in a colder color temperature. -1.67 to 1.67.
/// @param {Real} tint Compensate for a green or magenta tint.
function FX_WhiteBalance(enabled, temperature=0, tint=0) constructor {
	effect_name = "white_balance";
	sets = {
		enabledd : enabled,
		temperature : temperature,
		tint : tint,
	};
}

/// @desc Pixel-art upscaling 4x filter.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} smoothness Edges smoothness.
/// @param {Real} sharpness Edges sharpness.
/// @param {Real} downscale Compensate for varying pixel sizes.
function FX_HQ4x(enabled, smoothness=0.5, sharpness=1, downscale=2) constructor {
	effect_name = "hq4x";
	sets = {
		enabledd : enabled,
		smoothness : smoothness,
		sharpness : sharpness,
		downscale : downscale,
	};
}

/// @desc Fast Approximate Anti-Aliasing is a screen-space anti-aliasing algorithm to remove sharp edges.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} strength Anti-aliasing strength.
function FX_FXAA(enabled, strength=2) constructor {
	effect_name = "fxaa";
	sets = {
		enabledd : enabled,
		strength : strength,
	};
}

/// @desc The Bloom effect makes bright areas in your image glow. To do this, it creates fringes of light that extend from bright areas in your image.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} iterations Sets Bloom’s scattering, which is how far the effect reaches. Max: 16. recommended: 4 to 8.
/// @param {Real} threshold Set the level of brightness to filter out pixels under this level. 0 means full brightness. Values above 1 are HDR (which allows Bloom to glow without affecting the rest of the game's artwork).
/// @param {Real} intensity Set the strength of the Bloom filter. 0 to 5 recommended.
/// @param {Real} colorr The color that is multiplied by the bloom’s final color.
/// @param {Real} white_amount How close to white Bloom will look, in very saturated colors. 1 is full white.
/// @param {Bool} dirt_enable Defines whether to use dirt textures.
/// @param {Pointer.Texture} dirt_texture The texture id used for the Dirt Lens. Use sprite_get_texture() or surface_get_texture(). NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
/// @param {Real} dirt_intensity The intensity of Dirt Lens. 0 to 3 recommended.
/// @param {Real} dirt_scale The scale of Dirt Lens. 0.25 to 3 recommended.
/// @param {Real} downscale Sets the downscale of the Bloom, this affects the performance. 1 is full resolution = more resources needed, but look better.
/// @param {Bool} debug1 Allows you to see exactly where the bloom is hitting the light parts.
/// @param {Bool} debug2 Allows you to see the final bloom result alone.
function FX_Bloom(enabled, iterations=5, threshold=0.4, intensity=4.5, colorr=c_white, white_amount=0, dirt_enable=false, dirt_texture=undefined, dirt_intensity=2.5, dirt_scale=1, downscale=1, debug1=false, debug2=false) constructor {
	effect_name = "bloom";
	sets = {
		enabledd : enabled,
		iterations : iterations,
		threshold : threshold,
		intensity : intensity,
		colorr : make_color_ppfx(colorr),
		white_amount : white_amount,
		dirt_enable : dirt_enable,
		dirt_texture : __ppf_is_undefined(dirt_texture) ? __PPF_ST.default_dirt_lens : dirt_texture,
		dirt_intensity : dirt_intensity,
		dirt_scale : dirt_scale,
		downscale : downscale,
		debug1 : debug1,
		debug2 : debug2,
	};
}

/// @desc Double/Drunk vision effect (or just Slow Motion).
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} threshold Set the level of brightness to filter out pixels under this level. 0 means full brightness. Values above 1 are HDR.
/// @param {Real} intensity Sets the intensity level of the effect. 0.85 recommended.
/// @param {Real} iterations Defines how long the old frame remains on the screen. 5 to 30 recommended.
/// @param {Real} force Sets how strongly the slow motion effect is applied based on the threshold.
/// @param {Bool} debug Lets you see where the threshold reaches.
function FX_SlowMotion(enabled, threshold=0, intensity=0.85, iterations=10, force=2, debug=false) constructor {
	effect_name = "slow_motion";
	sets = {
		enabledd : enabled,
		threshold : threshold,
		intensity : intensity,
		iterations : iterations,
		force : force,
		debug : debug
	};
}

/// @desc Simulates the radial light scattering that arises when a very bright light source is partly obscured.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Array<Real>} position Sun position. An array with the normalized values (0 to 1), in this format: [x, y]. Please Note: The value is in screen-space. So it depends on where you are going to draw post-processing. Example: normalized GUI coordinates.
/// @param {Real} threshold Set the level of brightness to filter out pixels under this level. 0 means full brightness. Values above 1 are HDR (which allows Sunshafts to glow without affecting the rest of the game's artwork, useful for sun effect).
/// @param {Real} intensity Set the strength of the Sunshafts effect. 0 to 5 recommended.
/// @param {Real} dimmer Maximum brightness level to be reduced. 0 to 5 recommended.
/// @param {Real} scattering How far the sun's rays are projected. 0 to 1.
/// @param {Real} center_smoothness Softness of the central circle, to improve the visualization of the sun. 0 to 1.
/// @param {Bool} noise_enable Defines whether to use noise variations in the sun.
/// @param {Real} rays_intensity The intensity of noise rays. 0 to 1.
/// @param {Real} rays_tiling Repetition of noise rays. 1 to 10 recommended.
/// @param {Real} rays_speed The rays speed. 0 to 1 recommended.
/// @param {Real} downscale Sets the downscale of the sun shafts, this changes the performance.
/// @param {Pointer.Texture} noise_tex The noise texture, used for rays. NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
/// @param {Bool} debug Allows you to see exactly where the sunshaft is hitting the light parts.
function FX_SunShafts(enabled, position=[0.5, 0.5], threshold=1.5, intensity=3, dimmer=1.4, scattering=0.9, center_smoothness=0.3, noise_enable=false, rays_intensity=1, rays_tiling=1, rays_speed=0.03, downscale=0.5, noise_tex=undefined, debug=false) constructor {
	effect_name = "sunshafts";
	sets = {
		enabledd : enabled,
		position : position,
		threshold : threshold,
		intensity : intensity,
		dimmer : dimmer,
		scattering : scattering,
		center_smoothness : center_smoothness,
		noise_enable : noise_enable,
		rays_intensity : rays_intensity,
		rays_tiling : rays_tiling,
		rays_speed : rays_speed,
		downscale : downscale,
		noise_tex : __ppf_is_undefined(noise_tex) ? __PPF_ST.noise_perlin : noise_tex,
		debug : debug,
	};
}

/// @desc Is an effect that describes the extent to which objects that are more or less close to the plane of focus appear to be sharp.
/// This effect is given by an optical phenomenon called circles of confusion, which progressively increase as objects move away from the plane of focus;
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} radius Focus radius.
/// @param {Real} intensity Bokeh bright intensity
/// @param {Bool} shaped Defines whether the bokeh is shaped.
/// @param {Real} blades_aperture Sets shape's edge number.
/// @param {Real} blades_angle Sets the shape angle, in degrees.
/// @param {Bool} use_zdepth Defines if the DOF will use a depth map.
/// @param {Pointer.Texture} zdepth_tex Depth map (Z-Buffer) texture.
/// @param {Real} focus_distance Set the distance from the Camera to the focus point.
/// @param {Real} focus_range Set the range, between the Camera sensor and the Camera lens. The larger the value is, the shallower the depth of field.
/// @param {Real} downscale Sets the downscale of the Depth of Field, this changes the performance.
/// @param {Bool} debug Allows you to see exactly where the Bokeh is blurring. Colors in cyan color are where the blur hits.
function FX_DepthOfField(enabled, radius=10, intensity=1, shaped=false, blades_aperture=6, blades_angle=0, use_zdepth=false, zdepth_tex=undefined, focus_distance=0.2, focus_range=0.02, downscale=0.5, debug=false) constructor {
	effect_name = "depth_of_field";
	sets = {
		enabledd : enabled,
		radius : radius,
		intensity : intensity,
		shaped : shaped,
		blades_aperture : blades_aperture,
		blades_angle : blades_angle,
		use_zdepth : use_zdepth,
		zdepth_tex : __ppf_is_undefined(zdepth_tex) ? __PPF_ST.pixel_texture : zdepth_tex,
		focus_distance : focus_distance,
		focus_range : focus_range,
		downscale : downscale,
		debug : debug,
	};
}

/// @desc Simulates the blur that occurs in an image when a real-world camera films objects moving faster than the camera’s exposure time.
/// 
/// NOTE: If using an overlay_texture, if the radius is set to 0, the effect will not be automatically disabled (as is normal).
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} angle The angle to create fast movement effect.
/// @param {Real} radius The amount of blur. 0 to 1 recommended.
/// @param {Array<Real>} center Focus position. An array with the normalized values (0 to 1), in this format: [x, y].
/// @param {Real} mask_power Defines the radial center area of the mask, based on position. 0 to 15 recommended.
/// @param {Real} mask_scale Defines the radial mask scale. 0 to 3 recommended.
/// @param {Real} mask_smoothness Defines the mask border smoothness. 0 to 1.
/// @param {Pointer.Texture} overlay_texture Uses a texture to render things that aren't affected by motion blur.
function FX_MotionBlur(enabled, angle=0, radius=0, center=[0.5,0.5], mask_power=0, mask_scale=1.2, mask_smoothness=1, overlay_texture=undefined) constructor {
	effect_name = "motion_blur";
	sets = {
		enabledd : enabled,
		angle : angle,
		radius : radius,
		center : center,
		mask_power : mask_power,
		mask_scale : mask_scale,
		mask_smoothness : mask_smoothness,
		overlay_texture : overlay_texture,
	};
}

/// @desc Blurred zoom effect to give the impression of speed;
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} radius The amount of blur. 0 to 1 recommended.
/// @param {Real} inner How far the blur extends from the center.
/// @param {Array<Real>} center Focus position. An array with the normalized values (0 to 1), in this format: [x, y].
function FX_RadialBlur(enabled, radius=0.5, inner=1.5, center=[0.5,0.5]) constructor {
	effect_name = "radial_blur";
	sets = {
		enabledd : enabled,
		radius : radius,
		inner : inner,
		center : center,
	};
}

/// @desc Uses a LUT texture to apply color correction (useful for Mobile as it's lightweight).
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Pointer.Texture} texture The LUT texture. Use sprite_get_texture() or surface_get_texture(). NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
/// @param {Real} intensity How much the LUT-modified image merges with the original image.
/// @param {Array<Real>} size LUT size array. Default is [512, 512].
/// @param {Real} squares LUT squares amount. Default it 8.
function FX_LUT(enabled, texture, intensity, size=[512,512], squares=8) constructor {
	effect_name = "lut";
	sets = {
		enabledd : enabled,
		texture : texture,
		intensity : intensity,
		size : size,
		squares : squares
	};
}

/// @desc Adjusts the overall exposure of the screen.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {real} value Exposure amount. 0 to 2 recommended.
function FX_Exposure(enabled, value=1) constructor {
	effect_name = "exposure";
	sets = {
		enabledd : enabled,
		value : value,
	};
}

/// @desc Defines the amount of color displayed on the screen.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} color_factor The amount of colors. 2 to 256 recommended.
function FX_Posterization(enabled, color_factor=8) constructor {
	effect_name = "posterization";
	sets = {
		enabledd : enabled,
		color_factor : color_factor,
	};
}

/// @desc The amount of white color mixed with the image.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} value The amount of brightness. 0 to 2 recommended.
function FX_Brightness(enabled, value=1) constructor {
	effect_name = "brightness";
	sets = {
		enabledd : enabled,
		value : value,
	};
}

/// @desc The overall range of tonal values.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} value The contrast amount. 0 to 2 recommended.
function FX_Contrast(enabled, value=1) constructor {
	effect_name = "contrast";
	sets = {
		enabledd : enabled,
		value : value,
	};
}

/// @desc This effect separately controls the shadows, midtones, and highlights of the render.
/// Unlike Lift, Gamma, Gain, you can use this effect to precisely define the tonal range for shadows, midtones, and highlights.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} shadow_color Shadows color.
/// @param {Real} midtone_color Midtones color.
/// @param {Real} highlight_color Highlights color.
/// @param {Real} shadow_range Sets the value at which shadows will start to be affected. Default is 0.93.
/// @param {Real} highlight_range Sets the value at which hightlights will start to be affected. Default is 0.66.
function FX_ShadowMidtoneHighlight(enabled, shadow_color=c_white, midtone_color=c_white, highlight_color=c_white, shadow_range=0.93, highlight_range=0.66) constructor {
	effect_name = "shadow_midtone_highlight";
	sets = {
		enabledd : enabled,
		shadow_color : make_color_ppfx(shadow_color),
		midtone_color : make_color_ppfx(midtone_color),
		highlight_color : make_color_ppfx(highlight_color),
		shadow_range : shadow_range,
		highlight_range : highlight_range,
	};
}

/// @desc Relative bandwidth of the visible output from a light source;
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} value How much the grayscale is blended with the original image. 0 to 5 recommended.
function FX_Saturation(enabled, value=1) constructor {
	effect_name = "saturation";
	sets = {
		enabledd : enabled,
		value : value,
	};
}

/// @desc Change the overall color tone of an image.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} hue The hue, in degrees. 0 to 255. Tip: you can use color_get_hue(color) here.
/// @param {Real} saturation The saturation. 0 to 1.
function FX_HueShift(enabled, hue=0, saturation=255) constructor {
	effect_name = "hue_shift";
	sets = {
		enabledd : enabled,
		hue : 0,
		saturation : saturation,
	};
}

/// @desc Colorize image preserving white colors.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} hue The hue shift offset. 0 to 255.
/// @param {Real} saturation The color saturation. 0 to 255.
/// @param {Real} value The color luminosity. 0 to 255.
/// @param {Real} intensity How much to blend the colored image with the original image. 0 to 1.
function FX_Colorize(enabled, hue=0, saturation=140, value=255, intensity=1) constructor {
	effect_name = "colorize";
	sets = {
		enabledd : enabled,
		hue : hue,
		saturation : saturation,
		value : value,
		intensity : intensity,
	};
}

/// @desc Multiply the image by a color.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} color The color. Example: c_white | make_color_rgb() | make_color_hsv().
function FX_ColorTint(enabled, color=c_white) constructor {
	effect_name = "color_tint";
	sets = {
		enabledd : enabled,
		color : make_color_ppfx(color),
	};
}

/// @desc Invert all colors, such that white becomes black and vice versa.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} intensity How much the inverted image merges with the original image. 0 to 1.
function FX_InvertColors(enabled, intensity=1) constructor {
	effect_name = "invert_colors";
	sets = {
		enabledd : enabled,
		intensity : intensity,
	};
}

/// @desc Texture to be drawn after one of the lastest rendered effects. It is drawn after the "Invert Colors" effect and before the "Lift, Gamma, Gain" effect
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} intensity Texture alpha. 0 to 1.
/// @param {Real} zoom Texture zoom. 0 to 2 recommended.
/// @param {Pointer.Texture} texture The texture to be used. Use sprite_get_texture() or surface_get_texture(). NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
function FX_TextureOverlay(enabled, intensity=1, zoom=1, texture=undefined) constructor {
	effect_name = "texture_overlay";
	sets = {
		enabledd : enabled,
		intensity : intensity,
		texture : __ppf_is_undefined(texture) ? __PPF_ST.default_overlay_tex : texture,
		zoom : zoom,
	};
}

/// @desc This effect allows you to perform three-way color grading.
/// 
/// Lift controls the dark tones;
/// 
/// Gamma controls the mid-range tones with a power function;
// 
/// Gain is used to increase the signal and make highlights brighter;
/// 
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} lift_color The RGB lift color. Example: c_white.
/// @param {Real} gamma_color The RGB gamma color. Example: c_white.
/// @param {Real} gain_color The RGB gain color. Example: c_white.
function FX_LiftGammaGain(enabled, lift_color=c_white, gamma_color=c_white, gain_color=c_white, lift_intensity=1, gamma_intensity=1, gain_intensity=1) constructor {
	effect_name = "lift_gamma_gain";
	sets = {
		enabledd : enabled,
		lift : make_color_hdr_ppfx(lift_color, lift_intensity),
		gamma : make_color_hdr_ppfx(gamma_color, gamma_intensity),
		gain : make_color_hdr_ppfx(gain_color, gain_intensity),
	};
}

/// @desc Compress the dynamic range of an image to make it more suitable for display on devices with limited dynamic range (HDR to LDR). It is also used for aesthetic purposes.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} mode Tone Mapping mode. 0 = ACES film | 1 = Lottes | 2 = Uncharted 2 | 3 = Unreal 3
function FX_ToneMapping(enabled, mode=0) constructor {
	effect_name = "tone_mapping";
	sets = {
		enabledd : enabled,
		mode : mode,
	};
}

/// @desc Replace all colors in the image with colors from a palette, based on luminosity.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} row Vertical position on palette sprite, to use pixels in sequence.
/// @param {Bool} flip Sets whether to invert luminosity.
/// @param {Pointer.Texture} texture The palette LUT texture. Use sprite_get_texture() or surface_get_texture(). NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
/// @param {Real} pal_height Palette sprite height.
/// @param {Real} threshold Set the level of brightness to filter out pixels under this level. 0 to 1; 0 means all light pixels.
/// @param {Bool} limit_colors Defines whether you want to limit the number of colors in the image to the number of colors in the palette.
function FX_PaletteSwap(enabled, row=1, flip=false, texture=undefined, pal_height=1, threshold=0, limit_colors=true) constructor {
	effect_name = "palette_swap";
	sets = {
		enabledd : enabled,
		row : row,
		flip : flip,
		texture : __ppf_is_undefined(texture) ? __PPF_ST.default_palette : texture,
		pal_height : pal_height,
		threshold : threshold,
		limit_colors : limit_colors,
	};
}

/// @desc Blur effect similar to Gaussian Blur, but with better performance on low-end devices.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount Blur amount. This parameter is currently a multiplication with "iterations". 0 to 1.
/// @param {Real} mask_power Defines the radial center area of the mask, based on position. 0 to 15 recommended.
/// @param {Real} mask_scale Defines the radial mask scale. 0 to 3 recommended.
/// @param {Real} mask_smoothness Defines the mask border smoothness. 0 to 1.
/// @param {Real} downscale How much to downscale image. Higher numbers mean higher performance at the cost of sharpness. 2 recommended.
/// @param {Real} iterations The amount of blur passes. Larger numbers require more processing. 8 recommended.
function FX_KawaseBlur(enabled, amount=0.3, mask_power=0, mask_scale=1, mask_smoothness=1, downscale=2, iterations=8) constructor {
	effect_name = "kawase_blur";
	sets = {
		enabledd : enabled,
		amount : amount,
		mask_power : mask_power,
		mask_scale : mask_scale,
		mask_smoothness : mask_smoothness,
		downscale : downscale,
		iterations : iterations,
	};
}

/// @desc Gaussian Blur effect.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount The amount of blur. 0 to 1.
/// @param {Real} mask_power Defines the radial center area of the mask, based on position. 0 to 15 recommended.
/// @param {Real} mask_scale Defines the radial mask scale. 0 to 3 recommended.
/// @param {Real} mask_smoothness Defines the mask border smoothness. 0 to 1.
/// @param {Real} downscale How much to downscale image. Higher numbers mean higher performance at the cost of sharpness. 2 recommended.
function FX_GaussianBlur(enabled, amount=0.3, mask_power=0, mask_scale=1, mask_smoothness=1, downscale=0.5) constructor {
	effect_name = "gaussian_blur";
	sets = {
		enabledd : enabled,
		amount : amount,
		mask_power : mask_power,
		mask_scale : mask_scale,
		mask_smoothness : mask_smoothness,
		downscale : downscale,
	};
}

/// @desc It mimics the color distortion that a real-world camera produces when its lens fails to join all colors to the same point;
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} intensity How much the channels are distorted. 0 to 50 recommended.
/// @param {Real} angle The chromatic angle. Default it 35.
/// @param {bool} only_outer Defines whether the effect will be applied only to the edges, or entirely.
/// @param {Real} center_radius How much the effect is blended with the center. 0 to 3 recommended.
/// @param {Bool} blur_enable Defines whether to blur the chromatic effect.
/// @param {Pointer.Texture} prisma_lut_tex The spectral LUT texture, used to define the spectral colors. NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
/// Texture should be 8x3, with RGB channels horizontally. Use sprite_get_texture() or surface_get_texture().
function FX_ChromaticAberration(enabled, intensity=5, angle=35, only_outer=true, center_radius=0, blur_enable=false, prisma_lut_tex=undefined) constructor {
	effect_name = "chromatic_aberration";
	sets = {
		enabledd : enabled,
		intensity : intensity,
		angle : angle,
		only_outer : only_outer,
		center_radius : center_radius,
		blur_enable : blur_enable,
		prisma_lut_tex : __ppf_is_undefined(prisma_lut_tex) ? __PPF_ST.default_chromaber_prisma_lut : prisma_lut_tex,
	};
}

/// @desc VHS (80s decade) effect simulation.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} chromatic_aberration Sets the amount of chromatic aberration to use. 0 to 10 recommended.
/// @param {Real} scan_aberration Sets the amount of chromatic aberration to use on scan lines. 0 to 10 recommended.
/// @param {Real} grain_intensity Sets the amount of granular. 0 to 1.
/// @param {Real} grain_height Sets the height of a granular bar. 1 to 100 recommended. Low values make the bar thinner.
/// @param {Real} grain_fade Creates a gradient effect to smoothly fade the grain to the bottom. 0 to 1.
/// @param {Real} grain_amount Defines the number of repetitions of the grain bars. 1 to 100 recommended.
/// @param {Real} grain_speed Defines the grain movement speed. 0 to 1 recommended.
/// @param {Real} grain_interval Allows smoothing between grain bar variation and more spread. 0 to 1.
/// @param {Real} scan_speed Sets the speed at which scan glitch move. 0 to 10 recommended.
/// @param {Real} scan_size Set scan glitch size. 0 to 1.
/// @param {Real} scan_offset Set scan glitch offset, which is how much it will move horizontally. 0 to 1.
/// @param {Real} hscan_offset Sets how much the horizontal fixed scan will change sporadically. 0 to 1.
/// @param {Real} flickering_intensity Sets the intensity of the flickering/blinking effect. 0 to 1.
/// @param {Real} flickering_speed Sets the flickering animation speed. 0 to 10.0 recommended.
/// @param {Real} wiggle_amplitude Defines how much the image should shake vertically. 0 to 1.
function FX_VHS(enabled, chromatic_aberration=1.5, scan_aberration=0.25, grain_intensity=0.08, grain_height=2, grain_fade=0.7, grain_amount=4, grain_speed=0.2, grain_interval=0.2, scan_speed=1, scan_size=0.08, scan_offset=0.05, hscan_offset=0.001, flickering_intensity=0.06, flickering_speed=1, wiggle_amplitude=0.001) constructor {
	effect_name = "vhs";
	sets = {
		enabledd : enabled,
		chromatic_aberration : chromatic_aberration,
		scan_aberration : scan_aberration,
		grain_intensity : grain_intensity,
		grain_height : grain_height,
		grain_fade : grain_fade,
		grain_amount : grain_amount,
		grain_speed : grain_speed,
		grain_interval : grain_interval,
		scan_speed : scan_speed,
		scan_size : scan_size,
		scan_offset : scan_offset,
		hscan_offset : hscan_offset,
		flickering_intensity : flickering_intensity,
		flickering_speed : flickering_speed,
		wiggle_amplitude : wiggle_amplitude,
	};
}

/// @desc A fog/mist effect to give a gloomy look, which can be used in forests, imitate fire, and among others.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} intensity The mist intensity. 0 to 1 recommended.
/// @param {Real} scale Noise scale. 0 to 1.
/// @param {Real} tiling Repetition of noise rays. 0.25 to 10 recommended.
/// @param {Real} speedd Noise movement speed.
/// @param {Real} angle Noise angle.
/// @param {Real} contrast Noise contrast.
/// @param {Real} powerr Helps make noise sharper. 0 to 1 recommended.
/// @param {Real} remap Central softness. 0 to 0.99 recommended.
/// @param {Real} colorr Mist color tint.
/// @param {Real} mix Blending intensity with image lights.
/// @param {Real} mix_threshold The level of brightness to filter out pixels under this level. 0 to 1; 0 means all light pixels.
/// @param {Pointer.Texture} noise_tex The noise texture to be used as mist/fog. NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
/// @param {Array<Real>} offset Position offset. Use the camera position. An array with absolute values, in this format: [cam_x, cam_y].
/// @param {Real} fade_amount Partial fade amount.
/// @param {Real} fade_angle Partial fade angle.
function FX_Mist(enabled, intensity=0.5, scale=0.5, tiling=1, speedd=0.2, angle=0, contrast=0.8, powerr=1, remap=0.8, colorr=c_white, mix=0, mix_threshold=0, noise_tex=undefined, offset=[0.0,0.0], fade_amount=0, fade_angle=270) constructor {
	effect_name = "mist";
	sets = {
		enabledd : enabled,
		intensity : intensity,
		scale : scale,
		tiling : tiling,
		speedd : speedd,
		angle : angle,
		contrast : contrast,
		powerr : powerr,
		remap : remap,
		colorr : make_color_ppfx(colorr),
		mix : mix,
		mix_threshold : mix_threshold,
		noise_tex : __ppf_is_undefined(noise_tex) ? __PPF_ST.noise_perlin : noise_tex,
		offset : offset,
		fade_amount : fade_amount,
		fade_angle : fade_angle,
	}
}

/// @desc Anime-like speedlines effect. Useful for demonstrating amazement in visual novels or speed in racing games, among others.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} scale Noise scale. Values close to 0 make lines more stretched. 0 to 20 recommended.
/// @param {Real} tiling Repetition of noise rays. 1 to 16 recommended.
/// @param {Real} speedd Lines movement speed.
/// @param {Real} rot_speed Rotation speed.
/// @param {Real} contrast Lines contrast.
/// @param {Real} powerr Helps make lines sharper. 0 to 1 recommended.
/// @param {Real} remap Central softness. 0 to 0.99 recommended.
/// @param {Real} colorr The speedlines color tint.
/// @param {Real} mask_power Defines the radial center area of the mask, based on position. 0 to 15 recommended.
/// @param {Real} mask_scale Defines the radial mask scale. 0 to 3 recommended.
/// @param {Real} mask_smoothness Defines the mask border smoothness. 0 to 1.
/// @param {Pointer.Texture} noise_tex The noise texture to be used by the effect. NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
function FX_SpeedLines(enabled, scale=0.1, tiling=5, speedd=2, rot_speed=1, contrast=0.5, powerr=1, remap=0.8, colorr=c_white, mask_power=5, mask_scale=1.2, mask_smoothness=1, noise_tex=undefined) constructor {
	effect_name = "speedlines";
	sets = {
		enabledd : enabled,
		scale : scale,
		tiling : tiling,
		speedd : speedd,
		rot_speed : rot_speed,
		contrast : contrast,
		powerr : powerr,
		remap : remap,
		colorr : make_color_ppfx(colorr),
		mask_power : mask_power,
		mask_scale : mask_scale,
		mask_smoothness : mask_smoothness,
		noise_tex : __ppf_is_undefined(noise_tex) ? __PPF_ST.noise_simplex : noise_tex,
	};
}

/// @desc Dithering removes color banding artifacts in gradients, usually seen in sky boxes due to color quantization. It is also used for aesthetic purposes.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} threshold Set the level of brightness to filter out pixels under this level. 0 to 1; 0 means all light pixels.
/// @param {Real} strength How intense the dithering effect is applied.
/// @param {Real} mode Dithering technique to be used. 0 = Additive | 1 = Luminance based | 2 = RGB Color based
/// @param {Real} scale Pixel scale to compensate viewport size.
/// @param {Pointer.Texture} [bayer_texture] Bayer texture to be used by dithering. This is a small square texture. NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
/// @param {Real} bayer_size Dithering square texture sprite side size.
function FX_Dithering(enabled, threshold=0, strength=0.3, mode=0, scale=1, bayer_texture=undefined, bayer_size=8) constructor {
	effect_name = "dithering";
	sets = {
		enabledd : enabled,
		threshold : threshold,
		strength : strength,
		mode : mode,
		scale : scale,
		bayer_texture : __ppf_is_undefined(bayer_texture) ? __PPF_ST.bayer_8x8 : bayer_texture,
		bayer_size : bayer_size,
	};
}

/// @desc Simulates the random optical texture of photographic film, usually caused by small particles being present on the physical film;
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} intensity Noise grain texture alpha. 0 to 1.
/// @param {Real} luminosity The brightness level of the noise. 0 to 1.
/// @param {Real} scale Noise scale. 0 to 1 recommended.
/// @param {Bool} speedd Define if the Noise Grain speed.
/// @param {Bool} mix Defines if the noise is mixed with the screen.
/// @param {Pointer.Texture} noise_tex Noise texture. Use sprite_get_texture() or surface_get_texture(). NOTE: You need to enable "Separate Texture Page" in sprite properties, otherwise you will get visual artifacts.
function FX_NoiseGrain(enabled, intensity=0.3, luminosity=0.0, scale=1, speedd=true, mix=true, noise_tex=undefined) constructor {
	effect_name = "noise_grain";
	sets = {
		enabledd : enabled,
		intensity : intensity,
		luminosity : luminosity,
		scale : scale,
		speedd : speedd,
		mix : mix,
		noise_tex : __ppf_is_undefined(noise_tex) ? __PPF_ST.noise_point : noise_tex,
	};
}

/// @desc Vignetting is the term for the darkening and/or desaturating towards the edges of an image compared to the center. You can use vignetting to draw focus to the center of an image;
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} intensity Vignette alpha/transparency.
/// @param {Real} curvature Vignette roundness.
/// @param {Real} inner The inside area of Vignette. From 0 to 2.
/// @param {Real} outer The outside area of Vignette. From 0 to 2.
/// @param {Real} colorr Vigentte color.
/// @param {Array<Real>} center The position. An array with the normalized values (0 to 1), in this format: [x, y].
/// @param {Bool} rounded Defines that the Vignette will be a perfect circle.
/// @param {Bool} linear Use a linear curve or not.
function FX_Vignette(enabled, intensity=0.7, curvature=0.7, inner=0.7, outer=1.2, colorr=c_black, center=[0.5,0.5], rounded=false, linear=false) constructor {
	effect_name = "vignette";
	sets = {
		enabledd : enabled,
		intensity : intensity,
		curvature : curvature,
		inner : inner,
		outer : outer,
		colorr : make_color_ppfx(colorr),
		center : center,
		rounded : rounded,
		linear : linear,
	};
}

/// @desc Simulation of the NES transition.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount Fade amount. 1 is full dark.
/// @param {Real} levels Number of colors to be used (posterization).
function FX_NESFade(enabled, amount=0, levels=8) constructor {
	effect_name = "nes_fade";
	sets = {
		enabledd : enabled,
		amount : amount,
		levels : levels,
	};
}

/// @desc Simple fade to color effect (color overlay).
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount Fade amount. 1 is full blended.
/// @param {Real} colorr The fade color.
function FX_Fade(enabled, amount=0, colorr=c_black) constructor {
	effect_name = "fade";
	sets = {
		enabledd : enabled,
		amount : amount,
		colorr : make_color_ppfx(colorr),
	};
}

/// @desc Draw horizontal lines over the screen. It helps to simulate the effects of old CRT TVs.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} intensity Lines alpha. 0 to 1.
/// @param {Real} speedd Lines vertical movement speed. 0 to 5 recommended.
/// @param {Real} amount Lines amount. 0 to 1.
/// @param {Real} colorr Lines color tint. Example: c_black.
/// @param {Real} mask_power Defines the radial center area of the mask, based on position. 0 to 15 recommended.
/// @param {Real} mask_scale Defines the radial mask scale. 0 to 3 recommended.
/// @param {Real} mask_smoothness Defines the mask border smoothness. 0 to 1.
function FX_ScanLines(enabled, intensity=0.1, speedd=0.3, amount=0.7, colorr=c_black, mask_power=0, mask_scale=1.2, mask_smoothness=1) constructor {
	effect_name = "scanlines";
	sets = {
		enabledd : enabled,
		intensity : intensity,
		speedd : speedd,
		amount : amount,
		colorr : make_color_ppfx(colorr),
		mask_power : mask_power,
		mask_scale : mask_scale,
		mask_smoothness : mask_smoothness,
	};
}

/// @desc Creates vertical and horizontal bars for artistic cinematic effects.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} amount Bars level. 0 to 1.
/// @param {Real} colorr Bars color. Example: c_black.
/// @param {Bool} vertical_enable Enable vertical bars.
/// @param {Bool} horizontal_enable Enable horizontal bars.
/// @param {Bool} is_fixed If active, the bars will be fixed according to the lens distortion effect.
function FX_CinemaBars(enabled, amount=0.2, colorr=c_black, vertical_enable=true, horizontal_enable=false, is_fixed=true) constructor {
	effect_name = "cinema_bars";
	sets = {
		enabledd : enabled,
		amount : amount,
		colorr : make_color_ppfx(colorr),
		vertical_enable : vertical_enable,
		horizontal_enable : horizontal_enable,
		is_fixed : is_fixed,
	};
}

/// @desc Try to fix color blindness of Protanopia, Deutanopia and Tritanopia.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {Real} mode Fix mode: 0 > Protanopia | 1 > Deutanopia | 2 > Tritanopia.
function FX_ColorBlindness(enabled, mode=0) constructor {
	effect_name = "color_blindness";
	sets = {
		enabledd : enabled,
		mode : mode,
	};
}

/// @desc Sets color levels per channel.
/// @param {Bool} enabled Defines whether the effect starts active or not.
/// @param {real} red The red amount. 0 to 1.
/// @param {real} green The green amount. 0 to 1.
/// @param {real} blue The blue amount. 0 to 1.
function FX_Channels(enabled, red=1, green=1, blue=1) constructor {
	effect_name = "channels";
	sets = {
		enabledd : enabled,
		red : red,
		green : green,
		blue : blue,
	};
}


