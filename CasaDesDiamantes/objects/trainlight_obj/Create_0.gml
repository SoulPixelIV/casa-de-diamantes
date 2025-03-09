trainPhase = 0;
playingAudio = false;
currAudio = noone;

animationSpeed = 0.5;
image_speed = 0;

//Create alarmEmitter
alarmEmitter = audio_emitter_create();
audio_max_distance = 400;
audio_drop_start = 100;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(alarmEmitter, x, y, 0);
audio_emitter_falloff(alarmEmitter, audio_drop_start, audio_max_distance, 1);