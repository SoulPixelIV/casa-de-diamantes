/// @description Lensflare

draw_sprite(lensflareBlue_spr, 0, x, y);


/// @description Draw the animation
// Increase time
time += 1 / (room_speed * optionSeconds);
if (time > 1) time --;

// Calculate time curve
var frames = 1 / (optionFPS * optionSeconds);
var prog = ease(optionTimeCurve, time);
var t = (prog / frames - frac(prog / frames) + 1) * frames;

// Get textures and UVs
var maskTex = sprite_get_texture(spr, 0);
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
shader_set_uniform_f(uTime, t);
shader_set_uniform_f_array(uMaskTransform, vec);

// Draw the animation
draw_sprite_ext(spr, 0, x, y, 1, 1, 0, c_white, 1);

// Reset shader and texfilter
shader_reset();
gpu_set_tex_filter(false);