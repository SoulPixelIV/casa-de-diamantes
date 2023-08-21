/// @description Movement

x += movSpeedX;
y += movSpeedY;
image_angle = dir;

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
		if (!global.shotgunUpgrade1) {
			audio_play_sound(bulletHitGround_snd, 1, false);
			instance_change(bulletHit_obj, true);
		} else {
			audio_play_sound(bulletHitGround_snd, 1, false);
			movSpeedX = -movSpeedX;
			movSpeedY = -movSpeedY;
			image_alpha = 1;
			
			if (global.shotgunUpgrade2) {
				damageMultiplier = damageMultiplier * 1.31;
				if (damageMultiplierColor > make_color_rgb(255, 29, 29)) {
					damageMultiplierColor -= make_color_rgb(0, 30, 30);
				}
				image_blend = damageMultiplierColor;
			}
		}
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

image_alpha -= global.dt / 55;

if (image_alpha < 0)
{
	instance_destroy();
}