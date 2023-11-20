//Invincibility
if (invincibilityTimer > 0)
{
	invincibilityTimer -= global.dt;
}

//Collision
if (invincibilityTimer <= 0)
{
	if (!place_free(x, y) && (camera_obj.follow == player_obj || camera_obj.follow == camera_obj) && !place_meeting(x, y, colliderBulletFree_obj) && !place_meeting(x, y, colliderOneWay_obj))
	{
		audio_play_sound(bulletHitGround_snd, 1, false);
		instance_change(bulletHit_obj, true);
	}
}

movSpeedX = (lengthdir_x(movSpeed, dir)) * global.dt;
movSpeedY = (lengthdir_y(movSpeed, dir)) * global.dt;

image_angle = dir;

x += movSpeedX;
y += movSpeedY;
