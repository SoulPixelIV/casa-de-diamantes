/// @description Variables

lightSize = 2.4;
lightStrength = 0.4;
broken = false;
playedSound = false;

lightSizeSave = lightSize;

sparkEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, sparkEmitter, x - 48, x + 48, y - 48 + 113, y + 48 + 113, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_stream(global.partSystem, sparkEmitter, global.fireSparkPart, -100);

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);