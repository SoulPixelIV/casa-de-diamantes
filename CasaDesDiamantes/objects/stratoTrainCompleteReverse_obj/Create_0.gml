damage = 999;
knockback = 10;
damageCollision = true;
movSpeed = 3.2;

//Create honkEmitter
honkEmitter = audio_emitter_create();
audio_max_distance = 300;
audio_drop_start = 100;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(honkEmitter, x, y, 0);
audio_emitter_falloff(honkEmitter, audio_drop_start, audio_max_distance, 1);
