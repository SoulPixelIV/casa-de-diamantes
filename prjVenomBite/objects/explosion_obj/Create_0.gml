explosionDamage = 60;
dealtDamage = false;
lightSize = 4.4;
lightStrength = 0.92;
lifeLength = 24.4;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

var expSnd = audio_play_sound_on(emitter, explosion_snd, false, 1);
audio_sound_pitch(expSnd, random_range(0.8, 1));