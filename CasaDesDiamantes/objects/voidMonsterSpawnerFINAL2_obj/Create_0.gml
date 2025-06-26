voidEmitter = part_emitter_create(global.partSystem);
part_emitter_stream(global.partSystem, voidEmitter, global.voidPart, 3);

eyesEmitter = part_emitter_create(global.partSystem);
part_emitter_stream(global.partSystem, eyesEmitter, global.eyesPart, -20);

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 30;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

playedSound = false;
audioDelay = 800;