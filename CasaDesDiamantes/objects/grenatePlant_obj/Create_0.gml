timer = 800;
horspeed = 0;
verspeed = 0;
movSpeed = 4.3;
gravityStrength = -0.12;
animationSpeed = 0;
playedSound = false;

body = instance_nearest(x, y, zombieSoldierGirl_obj);

move_towards_point(body.playerPosX + random_range(-16, 16), body.playerPosY + random_range(-16, 16), movSpeed * global.dt);
image_angle = point_direction(x, y, body.playerPosX, body.playerPosY);

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);