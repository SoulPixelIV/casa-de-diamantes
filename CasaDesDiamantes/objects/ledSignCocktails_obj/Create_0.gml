/// @description Variables

lightSize = 3.1;
lightStrength = 0.7;

lightSizeSave = lightSize;

sparkEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, sparkEmitter, x - 64, x + 64, y - 64, y + 64, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(global.partSystem, sparkEmitter, global.ledRedPart, -50);

/// @description Initialize the main object
// Initialize the time variable
time = 0;

// Set sprite names
spr = ledSignCocktails_spr;
mask = mask_spr;
ramp = ramp_spr;

// Set options
optionFPS = 60;
optionSeconds = 4;
optionTimeCurve = "linear";

// Initialize the mask animation
maskAnimationInit();
