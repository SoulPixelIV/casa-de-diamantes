image_speed = 0;
animationSpeed = 0.3;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 600;
audio_drop_start = 100;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

snd = audio_play_sound_on(emitter, checkpoint_sng, true, 1);