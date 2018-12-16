/// @description Movement

x += lengthdir_x(movSpeed, dir);
y += lengthdir_y(movSpeed, dir);
image_angle = dir;

//Collision
if (!place_free(x, y))
{
	instance_change(bulletHit_obj, true)
}