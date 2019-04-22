/// @description Movement

x += lengthdir_x(movSpeed, dir);
y += lengthdir_y(movSpeed, dir);
image_angle = dir;

//Collision
if (!place_free(x, y))
{
	instance_change(bulletHit_obj, true);
}
if (place_meeting(x, y, enemy_obj))
{
	instance_change(bloodSpread_obj, true);
}