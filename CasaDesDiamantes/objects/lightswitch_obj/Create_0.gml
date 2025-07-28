//Create light
light = instance_create_layer(x, y, "GraphicsLayer", spotlightYellow_obj);
image_speed = 0;

lightTimer = 750;

lightTimerSave = lightTimer;

playedSound = false;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 800;
audio_drop_start = 400;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);