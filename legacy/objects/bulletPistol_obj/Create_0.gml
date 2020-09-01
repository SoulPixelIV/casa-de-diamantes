/// @description Variables

movSpeed = 5.2;
penetration = 2;
penetrationTime = 3;
deleteTimer = 95;
invincibilityTimer = 5;
dir = point_direction(playerBulletLine_obj.x, playerBulletLine_obj.y, mouse_x, mouse_y + random_range(-10, 10));

dealtDamage = false;
createdFire = false;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);
