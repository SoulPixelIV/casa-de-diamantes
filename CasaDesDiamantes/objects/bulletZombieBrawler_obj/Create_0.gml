/// @description Variables

movSpeed = 2.2;
createdFire = false;
invincibilityTimer = 5;
playedSound = false;
lifetime = 3000;
bullet2 = false;
bullet3 = false;
animationSpeed = 0.5;
direction = image_angle;
noMovement = false;

dealtDamage = false;
penetrationTime = 3;

dir = 0;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);