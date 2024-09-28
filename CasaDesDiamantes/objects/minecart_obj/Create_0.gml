inMinecart = false;
horspeed = 0;
verspeed = 0;
savePosX = x;
savePosY = y;
gravityStrength = -0.016;
movSpeed = 0.007;
playedCrashSound = false;
animationSpeed = 0;
animationSpeedMax = 2;
sprite_index = minecartForeground_spr;

trailDensity = 1;

trailDensitySave = trailDensity;

instance_create_layer(x, y, "BackgroundObjects", minecartBackground_obj);
instance_create_layer(x, y, "Instances", minecartHiddenSpawnpoint_obj);

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

minecartSound = audio_play_sound_on(emitter, minecart_snd, true, false);