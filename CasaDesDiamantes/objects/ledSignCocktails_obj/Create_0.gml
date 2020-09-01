/// @description Variables

lightSize = 3.1;
lightStrength = 0.7;

lightSizeSave = lightSize;

sparkEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, sparkEmitter, x - 64, x + 64, y - 64, y + 64, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(global.partSystem, sparkEmitter, global.ledRedPart, -50);

/// @description Set up the shader uniform variables
time = 0;

// Sprite names
spr = ledSignCocktails_spr; // Change these if you named them differently
mask = mask_spr;
ramp = ramp_spr;

// Options
optionFPS = 60;
optionSeconds = 4;
optionTimeCurve = "inBounce";

// Shader samplers & uniforms
uMaskTex = shader_get_sampler_index(shdMask, "maskTex");
uRampTex = shader_get_sampler_index(shdMask, "rampTex");
uRampXMin = shader_get_uniform(shdMask, "rampXMin");
uRampXMax = shader_get_uniform(shdMask, "rampXMax");
uRampYMin = shader_get_uniform(shdMask, "rampYMin");
uTime = shader_get_uniform(shdMask, "time");
uMaskTransform = shader_get_uniform(shdMask, "maskTransform");