timer = 600 + random_range(-50, 50);
horspeed = 0;
verspeed = 0;
gravityStrength = -0.12;
image_speed = 1;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 800;
audio_drop_start = 400;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);
