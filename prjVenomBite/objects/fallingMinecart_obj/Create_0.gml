falling = false;
image_index = 0;
image_speed = 0;
targetObject = noone;

if (instance_exists(object))
{
	targetObject = instance_nearest(x, y, object);
}