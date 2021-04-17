timer = 800;
horspeed = random_range(-4.5, 4.5);
verspeed = random_range(-1, -5);
gravityStrength = -0.12;
image_speed = 1;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);