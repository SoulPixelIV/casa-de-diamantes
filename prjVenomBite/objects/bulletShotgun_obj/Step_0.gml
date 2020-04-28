/// @description Movement

x += (lengthdir_x(movSpeed, dir)) * global.dt;
y += (lengthdir_y(movSpeed, dir)) * global.dt;
image_angle = dir;

//Collision
if (!place_free(x, y) && (camera_obj.follow == player_obj || camera_obj.follow == camera_obj) && !place_meeting(x, y, colliderBulletFree_obj))
{
	audio_play_sound(bulletHitGround_snd, 1, false);
	instance_change(bulletHit_obj, true);
}

if (dealtDamage)
{
	penetrationTime -= global.dt;
}
if (penetrationTime < 0)
{
	dealtDamage = false;
	penetrationTime = 3;
}

image_alpha -= global.dt / 75;

if (image_alpha < 0)
{
	instance_destroy();
}