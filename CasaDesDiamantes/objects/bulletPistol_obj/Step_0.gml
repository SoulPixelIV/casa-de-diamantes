/// @description Movement

x += (lengthdir_x(movSpeed, dir)) * global.dt;
y += (lengthdir_y(movSpeed, dir)) * global.dt;
image_angle = dir;

//Invincibility
if (invincibilityTimer > 0)
{
	invincibilityTimer -= global.dt;
}

//Collision
if (invincibilityTimer <= 0)
{
	if (!place_free(x, y) && (camera_obj.follow == player_obj || camera_obj.follow == camera_obj) && !place_meeting(x, y, colliderBulletFree_obj))
	{
		audio_play_sound_on(emitter, bulletHitGround_snd, false, 1);
		instance_change(bulletHit_obj, true);
	}
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

//Destroy
deleteTimer -= global.dt;
if (deleteTimer < 0)
{
	instance_destroy();
}
