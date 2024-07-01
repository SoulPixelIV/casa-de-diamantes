animationSpeed = 1;
playedSound = false;
startAnim = false;
teleportTimer = 2900;
blackscreenTimer = 250;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 3000;
audio_drop_start = 1200;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

