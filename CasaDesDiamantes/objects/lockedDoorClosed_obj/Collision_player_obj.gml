if (global.key)
{
	global.key = false;
	image_index = 1;
	var collider = instance_nearest(x, y, collider_obj);
	instance_destroy(collider);
}
