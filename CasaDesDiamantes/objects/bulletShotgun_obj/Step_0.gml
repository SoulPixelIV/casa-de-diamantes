/// @description Movement

image_angle = dir;

//Invincibility
if (invincibilityTimer > 0)
{
	invincibilityTimer -= global.dt;
}

//Collision
if (!place_free(x, y) && !place_meeting(x, y, colliderBulletFree_obj) && !place_meeting(x, y, colliderOneWay_obj)) {
	if (!global.shotgunUpgrade1) {
		if (global.bulletDelay < 0) {
			audio_play_sound(bulletHitGround_snd, 1, false);
			global.bulletDelay = global.bulletDelaySave;
		}
		instance_change(bulletHit_obj, true);
	} else {			
		dir += 180;

		if (global.bulletDelay < 0) {
			audio_play_sound(bulletHitGround_snd, 1, false);
			global.bulletDelay = global.bulletDelaySave;
		}
			
		if (global.shotgunUpgrade2) {
			damageMultiplier = damageMultiplier * 1.31;
			if (damageMultiplierColor > make_color_rgb(255, 29, 29)) {
				damageMultiplierColor -= make_color_rgb(0, 30, 30);
			}
			image_blend = damageMultiplierColor;
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

if (!global.shotgunUpgrade1) {
	image_alpha -= global.dt / 55;
}

if (image_alpha < 0)
{
	instance_destroy();
}

movSpeedX = (lengthdir_x(movSpeed, dir)) * global.dt;
movSpeedY = (lengthdir_y(movSpeed, dir)) * global.dt;

x += movSpeedX;
y += movSpeedY;

//Destroy
deleteTimer -= global.dt;
if (deleteTimer < 0 || distance_to_object(camera_obj) > 250)
{
	instance_destroy();
}