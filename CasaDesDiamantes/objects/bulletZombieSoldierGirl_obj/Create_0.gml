/// @description Variables

movSpeed = 5.2;
createdFire = false;
invincibilityTimer = 5;

dealtDamage = false;
penetrationTime = 3;

body = instance_nearest(x, y, zombieSoldierGirl_obj);
if (body.image_xscale == -1)
{
	dir = 180;
}
else
{
	dir = 0;
}

move_towards_point(body.playerPosX, body.playerPosY, movSpeed * global.dt);
image_angle = point_direction(x, y, body.playerPosX, body.playerPosY);

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);