timer = 100;
horspeed = 0;
verspeed = 0;
gravityStrength = -0.12;
damage = 10 * player_obj.bowReadyingImage;
image_speed = 0;
image_index = 0;
playedSound = false;
playedSound2 = false;
penetration = 3;
penetrationTime = 3;
invincibilityTimer = 5;
stuckInEnemy = false;
nearestEnemy = noone;
distXToEnemy = 0;
distYToEnemy = 0;
alarmDelayTimer = 80;

dealtDamage = false;
createdFire = false;

image_angle = player_obj.dirCursor;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);