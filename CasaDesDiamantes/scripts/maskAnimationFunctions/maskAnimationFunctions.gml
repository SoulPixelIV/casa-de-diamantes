// All the required functions for drawing the mask animations
// If you're only using them in one object you can move these to that objects create event

// Ease
/// @function				ease(type, time);
/// @param {string} type	The ease function name.
/// @param {real} time		The time.
/// @description			Easing time curves.
function ease(type, time) {
	// Original functions by Robert Penner (https://www.linkedin.com/in/robertpenner)
	// Translated to GML by ridiculoid (https://github.com/spacejazz/ezpz/blob/master/ease.gml)
	// Modified by Sarek Lambert
	
	time = clamp(time, 0, 1);
	
	switch (type) {
		case "linear":
			output = time;
			break;
		case "inQuad":
			output = sqr(time);
			break;
		case "outQuad":
			output = -time * (time - 2);
			break;
		case "inOutQuad":
			time *= 2;
			if (time < 1) {
				output = 0.5 * sqr(time);
			} else {
				output =- 0.5 * (--time * (time - 2) - 1);
			}
			break;
		case "inCubic":
			output = power(time, 3);
			break;
		case "outCubic":
			output = power(time - 1, 3) + 1;
			break;
		case "inOutCubic":
			time *= 2;
			if (time < 1) {
				output = 0.5 * power(time, 3);
			} else {
				output = 0.5 * (power(time - 2, 3) + 2);
			}
			break;
		case "inQuart":
			output = power(time, 4);
			break;
		case "outQuart":
			output = -(power(time - 1, 4) - 1);
			break;
		case "inOutQuart":
			time *= 2;
			if (time < 1) {
				output = 0.5 * power(time, 4);
			} else {
				output = 0.5 * -(power(time - 2, 4) - 2);
			}
			break;
		case "inQuint":
			output = power(time, 5);
			break;
		case "outQuint":
			output = power(time - 1, 5) + 1;
			break;
		case "inOutQuint":
			time *= 2;
			if (time < 1) {
				output = 0.5 * power(time, 5);
			} else {
				output = 0.5 * (power(time - 2, 5) + 2);
			}
			break;
		case "inSine":
			output = (1 - cos(time * (pi / 2)));
			break;
		case "outSine":
			output = sin(time * (pi / 2));
			break;
		case "inOutSine":
			output = 0.5 * (1 - cos(pi * time));
			break;
		case "inCirc":
			output = 1 - sqrt(1 - sqr(time));
			break;
		case "outCirc":
			time --;
			output = sqrt(1 - sqr(time));
			break;
		case "inOutCirc":
			time *= 2;
			if (time < 1) {
				output = 0.5 * (1 - sqrt(1 - sqr(time)));
			} else {	
				time -= 2;
				output = 0.5 * (sqrt(abs(1 - sqr(time))) + 1);
			}
			break;
		case "inExpo":
			output = power(2, 10 * (time - 1));
			break;
		case "outExpo":
			output = (-power(2, -10 * time) + 1);
			break;
		case "inOutExpo":
			time *= 2;
			if (time < 1) {
				output = 0.5 * power(2, 10 * --time);
			} else {
				output = 0.5 * (-power(2, -10 * --time) + 2);
			}
			break;
		case "inElastic":
			var p = 0.3;
			var s = p / (2 * pi) * arcsin(1);
			output = -(power(2,10 * (--time)) * sin((time * 1 - s) * (2 * pi) / p));
			break;
		case "outElastic":
			var p = 0.3;
			var s = p / (2 * pi) * arcsin(1);
			output = power(2, -10 * time) * sin((time * 1 - s) * (2 * pi) / p ) + 1;
			break;
		case "inOutElastic":
			if (time < 0.5) {
				output = (ease("inElastic", time * 2) * 0.5);
			} else {
				output = (ease("outElastic", time * 2 - 1) * 0.5 + 0.5);
			}
			break;
		case "inBack":
			var s = 1.70158;
			output = sqr(time) * ((s + 1) * time - s);
			break;
		case "outBack":
			var s = 1.70158;
			time --;
			output = sqr(time) * ((s + 1) * time + s) + 1;
			break;
		case "inOutBack":
			var s = 1.70158;
			time *= 2;
			if (time < 1) {
				s *= 1.525;
				output = 0.5 * (sqr(time) * ((s + 1) * time - s));
			} else {
				time -= 2;
				s *= 1.525;
				output = 0.5 * (sqr(time) * ((s + 1) * time + s) + 2);
			}
			break;
		case "inBounce":
			output = 1 - ease("outBounce", 1 - time);
			break;
		case "outBounce":
			if (time < 1 / 2.75) {
				output = 7.5625 * sqr(time);
			} else if (time < 2 / 2.75)	{
				time -= 1.5 / 2.75;
				output = (7.5625 * sqr(time) + 0.75);
			} else if (time < 2.5 / 2.75) {
				time -= 2.25 / 2.75;
				output = (7.5625 * sqr(time) + 0.9375);
			} else {
				time -= 2.625 / 2.75;
				output = (7.5625 * sqr(time) + 0.984375);
			}
			break;
		case "inOutBounce":
			if (time < 0.5) {
				output = ease("inBounce", time * 2) * 0.5;
			} else {
				output = ease("outBounce", time * 2 - 1) * 0.5 + 0.5;
			}
			break;
	}
	
	// Return function result
	return output;
};

// Get mask transformation vector
/// @function				getMaskTransformVector(spr, mask);
/// @param {real} spr		The base sprite to use.
/// @param {real} mask		The mask sprite to use.
/// @description			Calculates the mask transformation vector needed to draw the animation
function getMaskTransformVector(spr, mask) {
	var sprUVS = sprite_get_uvs(spr, 0);
	var sprW = sprUVS[2] - sprUVS[0];
	var sprH = sprUVS[3] - sprUVS[1];
	
	var maskUVS = sprite_get_uvs(mask, 0);
	var maskW = maskUVS[2] - maskUVS[0];
	var maskH = maskUVS[3] - maskUVS[1];
	
	var scaleX = maskW / sprW;
	var scaleY = maskH / sprH;
	var shiftX = maskUVS[0] - sprUVS[0] * scaleX;
	var shiftY = maskUVS[1] - sprUVS[1] * scaleY;
	
	return [scaleX, scaleY, shiftX, shiftY];
};

// Mask animation init
/// @function				maskAnimationInit();
/// @description			Gets the mask shaders uniforms and samplers.
function maskAnimationInit() {
uMaskTex = shader_get_sampler_index(shdMask, "maskTex");
uRampTex = shader_get_sampler_index(shdMask, "rampTex");
uRampXMin = shader_get_uniform(shdMask, "rampXMin");
uRampXMax = shader_get_uniform(shdMask, "rampXMax");
uRampYMin = shader_get_uniform(shdMask, "rampYMin");
uTime = shader_get_uniform(shdMask, "time");
uInvert = shader_get_uniform(shdMask, "invert");
uRimSize = shader_get_uniform(shdMask, "rimSize");
uSmoothness = shader_get_uniform(shdMask, "smoothness");
uPulseRange = shader_get_uniform(shdMask, "pulseRange");
uMaskTransform = shader_get_uniform(shdMask, "maskTransform");	
};

// Mask animation draw
/// @function				maskAnimationDraw(spr, mask, ramp, time);
/// @param {real} spr		The base sprite.
/// @param {real} mask		The mask sprite.
/// @param {real} ramp		The ramp sprite.
/// @param {real} time		The time.
/// @description			Draws the mask animation.
function maskAnimationDraw(spr, mask, ramp, time) {
// Get textures and UVs
var maskTex = sprite_get_texture(mask, 0);
var rampTex = sprite_get_texture(ramp, 0);
var vec = getMaskTransformVector(spr, mask);
var uvs = texture_get_uvs(rampTex);

// Set shader and texfilter
gpu_set_tex_filter_ext(uRampTex, true);
shader_set(shdMask);

// Pass samplers and uniforms
texture_set_stage(uMaskTex, maskTex);
texture_set_stage(uRampTex, rampTex);
shader_set_uniform_f(uRampXMin, uvs[0]);
shader_set_uniform_f(uRampXMax, uvs[2] - uvs[0]);
shader_set_uniform_f(uRampYMin, uvs[1]);
shader_set_uniform_f(uTime, time);
shader_set_uniform_f(uInvert, optionInvert);
shader_set_uniform_f(uRimSize, optionColorRimSize);
shader_set_uniform_f(uSmoothness, optionEdgeSmoothness);
shader_set_uniform_f(uPulseRange, optionPulseRange);
shader_set_uniform_f_array(uMaskTransform, vec);

// Draw the animation
draw_sprite_ext(spr, 0, x, y, 1, 1, 0, c_white, 1);

// Reset shader and texfilter
shader_reset();
gpu_set_tex_filter(false);
};
