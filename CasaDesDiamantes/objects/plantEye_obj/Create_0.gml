fallingDone = false;
dir = choose(1, -1);
size = random_range(0.5, 0.7);
animationSpeed = 0.75;

image_xscale = size;
image_yscale = size;

image_angle = random_range(0, 359);

timer = 500;
playedSound = false;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);