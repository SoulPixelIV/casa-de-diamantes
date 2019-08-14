/// @description Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

x += (lengthdir_x(movSpeed, dir)) * dt;
y += (lengthdir_y(movSpeed, dir)) * dt;
image_angle = dir;

//Collision
if (!place_free(x, y))
{
	audio_play_sound(bulletHitGround_snd, 1, false);
	instance_change(bulletHit_obj, true);
}

if (dealtDamage)
{
	penetrationTime -= dt;
}
if (penetrationTime < 0)
{
	dealtDamage = false;
	penetrationTime = 3;
}
