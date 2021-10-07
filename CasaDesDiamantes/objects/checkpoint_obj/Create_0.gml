image_speed = 0;
animationSpeed = 0.3;
active = false;
used = false;
moneyDropMin = 5;
moneyDropMax = 17;

playedSound1 = false;
playedSound2 = false;
timer1Sound = 100;
timer2Sound = 450;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 800;
audio_drop_start = 400;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

//Sound Position
audio_emitter_position(emitter, x, y, 0);