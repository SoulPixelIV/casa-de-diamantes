/// @description Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

x += (lengthdir_x(movSpeed, dir)) * dt;
y += (lengthdir_y(movSpeed, dir)) * dt;
image_angle = dir;

//Collision
if (!place_free(x, y))
{
	instance_change(bulletHit_obj, true);
}
if (place_meeting(x, y, headshotHitbox_obj))
{
	var hitbox = instance_place(x, y, headshotHitbox_obj);
	var enemyTarget;
	with (hitbox)
	{
		enemyTarget = instance_place(x, y, enemy_obj);
	}
	enemyTarget.hp -= 40;
	instance_change(bloodSpread_obj, true);
}
if (place_meeting(x, y, enemy_obj))
{
	var enemyTarget = instance_place(x, y, enemy_obj);
	enemyTarget.hp -= 10;
	instance_change(bloodSpread_obj, true);
}