timer = 800;
horspeed = 0;
verspeed = 0;
gravityStrength = -0.12;
damage = 25 * player_obj.bowReadyingImage;
image_speed = 1;
playedSound = false;
penetration = 2;
penetrationTime = 3;
deleteTimer = 2250;
invincibilityTimer = 5;

dealtDamage = false;
createdFire = false;

image_angle = player_obj.currDir;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);